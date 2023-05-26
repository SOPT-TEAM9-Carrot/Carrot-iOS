//
//  HomeLocalJobView.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

protocol HomeLocalJobDataSourceDelegate: AnyObject {
    func passId(postId: Int)
}

final class HomeLocalJobView: UIView {
    
    weak var delegate: HomeLocalJobDataSourceDelegate?
    
    var jobLocalModel: [JobLocalModel] = []
    
    // MARK: - 상단 라벨
    private let title1Label = UILabel()
    private let title2Label = UILabel()
    private lazy var homeLocalJobCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
    private let reloadButton = GrayUIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setRegister()
        setDelegate()
        fetchLocalJob()
    }
    
    required init?(coder: NSCoder) {
        fatalError("HomeLocalJobView Error!")
    }
}

extension HomeLocalJobView {
    
    private func setUI() {
        backgroundColor = .white
        
        title1Label.do {
            $0.textColor = .black
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.text = "내 주변 사장님이"
        }
        
        title2Label.do {
            $0.textColor = .black
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.text = "상도동 떡잎방법대님을 찾고 있어요!"
        }
        
        homeLocalJobCollectionView.do {
            $0.isScrollEnabled = false
            $0.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            $0.backgroundColor = .white
        }
        
        reloadButton.do {
            $0.setUIOfButtonFor(type: .lookForOtherJobs)
        }
    }
    
    private func setLayout() {
        self.addSubviews(title1Label, title2Label, reloadButton)
        self.addSubview(homeLocalJobCollectionView)
        title1Label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(17)
            $0.height.equalTo(26)
        }
        title2Label.snp.makeConstraints {
            $0.top.equalTo(title1Label.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(17)
            $0.height.equalTo(26)
        }
        // MARK: - CollectionView Cell 위치 잡는 부분
        homeLocalJobCollectionView.snp.makeConstraints {
            $0.top.equalTo(title2Label.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(448)
        }
        reloadButton.snp.makeConstraints {
            $0.top.equalTo(homeLocalJobCollectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(32)
        }
    }
    
    private func flowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width / 2.0) - 20
        //        flowLayout.itemSize = CGSize(width: 174, height: 220)
        flowLayout.itemSize = CGSize(width: width, height: 220)
        // 사실 이 부분.. 뷰 기준으로 나누고 해야하는 거 같은데 일단은 임의로 width값 바꿔서 넣었어요..
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.minimumLineSpacing = 7
        return flowLayout
    }
    
    private func setRegister() {
        homeLocalJobCollectionView.registerCell(HomeLocalJobCollectionViewCell.self)
    }
    
    private func setDelegate() {
        homeLocalJobCollectionView.dataSource = self
        homeLocalJobCollectionView.delegate = self
    }
}

extension HomeLocalJobView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.jobLocalModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HomeLocalJobCollectionViewCell.self, indexPath: indexPath)
        cell.configureCell(model: jobLocalModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passingId = jobLocalModel[indexPath.item].postId
        self.delegate?.passId(postId: passingId)
    }
}

extension HomeLocalJobView {
    private func fetchLocalJob() {
        HomeRecommendService.shared.homeRecommend { response in
            switch response {
            case .success(let data):
                guard let data = data as? RecommendResponse else { return }
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                dump(data)
                print("💚💚💚💚💚💚💚💚💚💚성공💚💚💚💚💚💚💚💚💚💚")
                self.jobLocalModel = data.convertToJob()
                self.homeLocalJobCollectionView.reloadData()
            case .serverErr:
                print("🔥🔥🔥🔥🔥서버 이상 서버 이상🔥🔥🔥🔥🔥")
            case .pathErr:
                print("—————경로이상——————")
            case .networkErr:
                print("💧💧💧💧💧네트워크에런데 뭔ㄹ지머름💧💧💧💧💧")
            default:
                return
            }
        }
    }
}
