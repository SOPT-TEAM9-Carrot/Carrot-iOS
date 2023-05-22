//
//  DetailReviewPagingView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class DetailReviewPagingView: UIView {
    
    private let serverModel = ReviewServerModel.fetchReviewServerData()
    private let reviewModel = ReviewModel.fetchReviewModelDummyData()

    private let applicantsReview = UILabel()
    private let reviewBoxOne = ApplicantsCommentsBox()
    private let reviewBoxTwo = ApplicantsCommentsBox()
    private let reviewBoxThree = ApplicantsCommentsBox()
    private let loadMoreReviewTypeComments = ApplicantsCommentsBox()
    
    private let reviewTableView = UITableView()
    
    private let loadMoreReviewsButton = GrayUIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailReviewPagingView {
    
    private func setDelegate() {
        reviewTableView.dataSource = self
    }
    
    private func setUI() {
        self.backgroundColor = .clear
        
        applicantsReview.do {
            $0.text = "지원자 한마디"
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.gray1
        }
        
        reviewBoxOne.do {
            $0.passComments(of: .respect)
        }
        
        reviewBoxTwo.do {
            $0.passComments(of: .breakTime)
        }
        
        reviewBoxThree.do {
            $0.passComments(of: .extraWageWeekend)
        }
        
        loadMoreReviewTypeComments.do {
            $0.asMoreButton()
        }
        
        reviewTableView.do {
            $0.registerCell(ReviewTableViewCell.self)
            $0.rowHeight = 150
            $0.isScrollEnabled = false
            $0.isUserInteractionEnabled = false
            $0.separatorStyle = .none
        }
        
        loadMoreReviewsButton.do {
            $0.setUIOfButtonFor(type: .bringMoreReviews)
        }
    }
    
    private func setLayout() {
        self.addSubviews(applicantsReview, reviewBoxOne, reviewBoxTwo, reviewBoxThree, loadMoreReviewTypeComments, reviewTableView, loadMoreReviewsButton)
        
        applicantsReview.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(13)
        }
        
        reviewBoxOne.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(applicantsReview.snp.bottom).offset(5)
            $0.height.equalTo(34)
            $0.width.equalTo(186)
        }
        
        reviewBoxTwo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(reviewBoxOne.snp.bottom).offset(10)
            $0.height.equalTo(34)
            $0.width.equalTo(150)
        }
        
        reviewBoxThree.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(reviewBoxTwo.snp.bottom).offset(10)
            $0.height.equalTo(34)
            $0.width.equalTo(175)
        }
        
        loadMoreReviewTypeComments.snp.makeConstraints {
            $0.centerY.equalTo(reviewBoxThree.snp.centerY)
            $0.leading.equalTo(reviewBoxThree.snp.trailing).offset(8)
            $0.height.equalTo(34)
            $0.width.equalTo(73)
        }
        
        reviewTableView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(loadMoreReviewTypeComments.snp.bottom).offset(6)
            $0.height.equalTo(440)
        }
        
        loadMoreReviewsButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(32)
            $0.top.equalTo(reviewTableView.snp.bottom).offset(20)
        }
    }
}

extension DetailReviewPagingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ReviewTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(serverModel: serverModel[indexPath.row], dummyModel: reviewModel[indexPath.row])
        
        return cell
    }
}
