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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setRegister()
        setDelegate()
    }
}

extension ReviewViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
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
    
    // MARK: - @objc Methods
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
