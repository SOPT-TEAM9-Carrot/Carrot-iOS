//
//  ReviewViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class ReviewViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var reviewTableView = UITableView(frame: .zero, style: .plain)
    private let serverModel = ReviewServerModel.fetchReviewServerData()
    private let reviewModel = ReviewModel.fetchReviewModelDummyData()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
        setRegister()
        setDelegate()
    }
}

extension ReviewViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
        reviewTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(reviewTableView)
        
        reviewTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Methods
    
    private func setRegister() {
        reviewTableView.registerCell(ReviewTableViewCell.self)
    }
    
    private func setDelegate() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
    private func popToJobDetail() {
        print("popToJobDetail")
//        navigationController?.popViewController(animated: true)
//        navigationController?.navigationBar.isHidden = true
    }
    
//    private func setNavigationBar() {
//
//        navigationController?.navigationBar.tintColor = Color.gray1
//        navigationController?.navigationBar.backgroundColor = Color.white
//        navigationItem.leftBarButtonItem = UIBarButtonItem (
//            image: Image.carrotXMark,
//            style: .plain,
//            target: self,
//            action: #selector(backButtonTapped))
//        let attributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.foregroundColor: Color.gray1,
//            NSAttributedString.Key.font: UIFont.notoSansFont(weightOf: .Bold, sizeOf: .font14)!
//        ]
//        let navigationItem = UINavigationItem()
//        let title = "후기"
//        navigationItem.title = title
//        navigationItem.titleView = UILabel()
//
//        if let titleLabel = navigationItem.titleView as? UILabel {
//            titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
//        }
//    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = Color.gray1
        navigationController?.navigationBar.backgroundColor = Color.white
        let buttonInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8) // 원하는 여백 값으로 수정
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Image.carrotBack,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: Color.gray1,
            NSAttributedString.Key.font: UIFont.notoSansFont(weightOf: .Bold, sizeOf: .font14)!
        ]
        let title = "후기"
        navigationItem.title = title
        
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        } else {
            let titleLabel = UILabel()
            titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
            navigationItem.titleView = titleLabel
        }
    }

    // MARK: - @objc Methods
    
    @objc private func backButtonTapped() {
        popToJobDetail()
    }
}

extension ReviewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension ReviewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serverModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ReviewTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(serverModel: serverModel[indexPath.row], dummyModel: reviewModel[indexPath.row])
        return cell
    }
}
