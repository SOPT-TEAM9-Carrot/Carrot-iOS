//
//  DetailReviewSegmentView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class DetailReviewSegmentView: UIView {
    
    private var isOtherJobTapped: Bool = false {
        didSet {
            if isOtherJobTapped == true {
                reviewSegmentButton.setTitleColor(Color.gray5, for: .normal)
                otherJobsSegmentButton.setTitleColor(Color.mainColor1, for: .normal)
            } else {
                reviewSegmentButton.setTitleColor(Color.mainColor1, for: .normal)
                otherJobsSegmentButton.setTitleColor(Color.gray5, for: .normal)
            }
        }
    }
    
    weak var delegate: JobDetailPagingDelegate?

    private let reviewSegmentButton = UIButton(type: .system)
    private let otherJobsSegmentButton = UIButton(type: .system)
    private let dividerView = UIView()
    private let segmentLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailReviewSegmentView {
    
    private func setUI() {
        self.backgroundColor = .clear
        
        reviewSegmentButton.do {
            $0.backgroundColor = .clear
            $0.setTitle("후기 1", for: .normal)
            $0.setTitleColor(Color.mainColor1, for: .normal)
            $0.titleLabel?.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.addTarget(self, action: #selector(reviewTapped), for: .touchUpInside)
        }
        
        otherJobsSegmentButton.do {
            $0.backgroundColor = .clear
            $0.setTitle("다른알바", for: .normal)
            $0.setTitleColor(Color.gray5, for: .normal)
            $0.titleLabel?.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.addTarget(self, action: #selector(otherJobsTapped), for: .touchUpInside)
        }
        
        dividerView.do {
            $0.backgroundColor = Color.gray6
        }
        
        segmentLineView.do {
            $0.backgroundColor = Color.mainColor1
        }
    }
    
    private func setLayout() {
        self.addSubviews(reviewSegmentButton, otherJobsSegmentButton, dividerView, segmentLineView)
        
        reviewSegmentButton.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.trailing.equalToSuperview().dividedBy(2)
            $0.height.equalTo(44)
        }
        
        otherJobsSegmentButton.snp.makeConstraints {
            $0.leading.equalTo(reviewSegmentButton.snp.trailing)
            $0.trailing.top.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        dividerView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(reviewSegmentButton.snp.bottom)
        }
        
        segmentLineView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.centerX.equalTo(reviewSegmentButton.snp.centerX)
            $0.width.equalTo(dividerView.snp.width).dividedBy(2)
            $0.top.equalTo(dividerView.snp.top)
        }
    }
}

extension DetailReviewSegmentView {
    
    @objc
    private func reviewTapped() {
        if isOtherJobTapped == true {
            isOtherJobTapped.toggle()
            segmentLineView.snp.remakeConstraints {
                $0.height.equalTo(2)
                $0.centerX.equalTo(reviewSegmentButton.snp.centerX)
                $0.width.equalTo(dividerView.snp.width).dividedBy(2)
                $0.top.equalTo(dividerView.snp.top)
            }
            
            UIView.animate(withDuration: 0.15) {
                self.layoutIfNeeded()
            }
            
            self.delegate?.changePage(toNumber: 0)
        }
    }
    
    @objc
    private func otherJobsTapped() {
        if isOtherJobTapped == false {
            isOtherJobTapped.toggle()
            segmentLineView.snp.remakeConstraints {
                $0.centerX.equalTo(otherJobsSegmentButton.snp.centerX)
                $0.height.equalTo(2)
                $0.width.equalTo(dividerView.snp.width).dividedBy(2)
                $0.top.equalTo(dividerView.snp.top)
            }
            
            UIView.animate(withDuration: 0.15) {
                self.layoutIfNeeded()
            }
            
            self.delegate?.changePage(toNumber: 1)
        }
    }
}
