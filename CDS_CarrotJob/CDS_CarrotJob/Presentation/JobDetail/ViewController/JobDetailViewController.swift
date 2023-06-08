//
//  JobDetailViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

import Alamofire
import SnapKit
import Then

protocol JobDetailContstraintChangeDelegate: AnyObject {
    func modifyConstraintTo(heightOf: CGFloat)
}

protocol JobDetailNetworkServiceProtocol: Any {
    associatedtype NetworkCompletion
    
    func fetchDetailData(requestId: Int, completion: NetworkCompletion)
    
    init()
}

extension JobDetailNetworkServiceProtocol {
    private func judgeStatus<T: Codable>(modelType: T.Type, by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print(statusCode)
        switch statusCode {
        case 200: return isValidData(modelType: modelType, data: data)
        case 400, 404: return isValidData(modelType: modelType, data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }

    private func isValidData<T: Codable>(modelType: T.Type, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(modelType.self, from: data) else {
            return .pathErr}

        return .success(decodedData as Any)
    }
}

final class JobDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var networkServices: [any JobDetailNetworkServiceProtocol]
    private let networkManager = JobDetailNetworkManager.shared
    private var mainDetailData = JobDetailModel(userId: 0, image: "", categories: [], title: "", hourlyWage: 0, content: "", address: "")
    private var mainDetailReviewData = ReviewsListModel(userID: 0, nickname: "", imageURL: "", degree: 0.0, reviews: [])
    private var jobPostsData: [PostModel] = []
    
    private var postId: Int = 0
    
    private let customNavigationBar = JobDetailNavigationBarView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainDetailView = MainDetailView()
    private let detailProfileView = DetailProfileView()
    private let detailReviewView = DetailReviewListView()
    private let detailLocalListView = DetailLocalListView()
    
    private let bottomStickyView = BottomStickyView()
    private let toastView = JobDetailToastView()
    
    // MARK: - View Life Cycle
    
    init(networks: [any JobDetailNetworkServiceProtocol]) {
        self.networkServices = networks
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setLayout()

        fetchMainDetailData(postId: self.postId) {
            self.mainDetailView.passTextOfJobDetail(imageUrl: self.mainDetailData.image, titleText: self.mainDetailData.title, contentText: self.mainDetailData.content, wage: self.mainDetailData.hourlyWage)
            self.mainDetailView.passData(categories: self.mainDetailData.categories)
            
            self.fetchEmployerInformation(userId: self.mainDetailData.userId) {
                self.detailProfileView.employerProfileView.configureView(imageString: self.mainDetailReviewData.imageURL, employerName: self.mainDetailReviewData.nickname, temperature: self.mainDetailReviewData.degree)
                self.detailReviewView.reviewPageView.passData(serverData: self.mainDetailReviewData.reviews, jobTitle: self.mainDetailData.title)
                let cellCount = self.mainDetailReviewData.reviews.count
                self.detailReviewView.snp.updateConstraints {
                    $0.height.equalTo(290 + 150 * cellCount)
                }
                
                self.detailReviewView.reLayoutTableView(withCountOf: cellCount)
            }
            
            self.detailProfileView.kakaoMapView.passAddress(address: self.mainDetailData.address)
            
            let textViewHeight: CGFloat = self.mainDetailView.describingTextView.intrinsicContentSize.height
            self.makeDetailViewDynamicHegihtOf(textViewHeight)
        }
        
        fetchOtherJobsData {
            self.detailLocalListView.passData(data: self.jobPostsData)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension JobDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setDelegate() {
        detailReviewView.delegate = self
        detailProfileView.kakaoMapView.delegate = self
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        scrollView.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
        
        detailProfileView.do {
            $0.backgroundColor = .clear
        }
        
        customNavigationBar.do {
            $0.popButton.addTarget(self, action: #selector(popTapped), for: .touchUpInside)
        }
        
        detailReviewView.do {
            $0.reviewPageView.loadMoreReviewsButton.addTarget(self, action: #selector(loadMoreButtonTapped), for: .touchUpInside)
        }
        
        bottomStickyView.do {
            $0.applyButton.addTarget(self, action: #selector(applyTapped), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(customNavigationBar, scrollView, bottomStickyView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(mainDetailView, detailProfileView, detailReviewView, detailLocalListView)
        
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(customNavigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        mainDetailView.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
            $0.height.equalTo(700)
        }
        
        detailProfileView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(mainDetailView.snp.bottom)
            $0.height.equalTo(380)
        }
        
        detailReviewView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(detailProfileView.snp.bottom)
            $0.height.equalTo(735)
        }
        
        detailLocalListView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(detailReviewView.snp.bottom)
            $0.height.equalTo(630)
            $0.bottom.equalToSuperview()
        }
        
        bottomStickyView.snp.makeConstraints {
            $0.height.equalTo(110)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension JobDetailViewController {
    private func fetchMainDetailData(postId: Int, completion: @escaping () -> Void) {
        networkManager.fetchDetailData(postId: postId) { response in
            switch response {
            case .success(let data):
                guard let data = data as? JobDetailListModel else { return }
                let currentData = data.data
                self.mainDetailData.address = currentData.address
                self.mainDetailData.image = currentData.image
                self.mainDetailData.title = currentData.title
                self.mainDetailData.categories = currentData.categories
                self.mainDetailData.hourlyWage = currentData.hourlyWage
                self.mainDetailData.content = currentData.content
                self.mainDetailData.userId = currentData.userId
                completion()
            default:
                print("Network Failed - Main")
                completion()
            }
        }
    }
    
    private func fetchEmployerInformation(userId: Int, completion: @escaping () -> Void) {
        networkManager.fetchReviews(employerID: userId, postCount: 3) { response in
            switch response {
            case .success(let data):
                guard let data = data as? JobReviewListModel else { return }
                let currentData = data.data
                self.mainDetailReviewData.degree = currentData.degree
                self.mainDetailReviewData.imageURL = currentData.imageURL
                self.mainDetailReviewData.nickname = currentData.nickname
                self.mainDetailReviewData.userID = currentData.userID
                self.mainDetailReviewData.reviews = currentData.reviews
                completion()
            default:
                print("Network Failed - Employer")
                completion()
            }
        }
    }
    
    private func fetchOtherJobsData(completion: @escaping () -> Void) {
        networkManager.fetchOtherJobs(postCount: 3) { response in
            switch response {
            case .success(let data):
                guard let data = data as? JobListsModel else { return }
                self.jobPostsData = data.data.posts
                
                completion()
            default:
                print("Network Failed - OtherJobs")
                completion()
            }
        }
    }
    
    /// Get changed height of TextView and Update the layout
    private func makeDetailViewDynamicHegihtOf(_ height: CGFloat) {
        mainDetailView.snp.updateConstraints {
            $0.height.equalTo(650 + height)
        }
    }
}

extension JobDetailViewController: JobDetailContstraintChangeDelegate {
    func modifyConstraintTo(heightOf height: CGFloat) {
        detailReviewView.snp.updateConstraints {
            $0.height.equalTo(height)
        }
    }
}

extension JobDetailViewController: JobDetailToastDelegate {
    func copySuccessed() {
        view.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().inset(100)
        }
        
        UIView.animate(withDuration: 0.05) { [weak self] in
            self?.toastView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        
        UIView.animate(withDuration: 0.08) { [weak self] in
            self?.toastView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
        UIView.animate(withDuration: 0.05) { [weak self] in
            self?.toastView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }
        
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.toastView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.toastView.snp.removeConstraints()
            self?.toastView.removeFromSuperview()
        }
    }
}

extension JobDetailViewController {
    @objc
    private func popTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func loadMoreButtonTapped() {
        print("dsfsdfdsf")
        let userId = self.mainDetailData.userId
        let detailReviewVC = ReviewViewController()
        detailReviewVC.passUserId(userId: userId)
        
        self.navigationController?.pushViewController(detailReviewVC, animated: true)
    }
    
    @objc
    private func applyTapped() {
        let applyVC = ApplyViewController()
        self.navigationController?.pushViewController(applyVC, animated: true)
    }
    
    func passPostId(postId: Int) {
        self.postId = postId
    }
}
