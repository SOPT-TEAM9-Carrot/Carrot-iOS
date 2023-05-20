//
//  MainDetailView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class MainDetailView: UIView {
    
    // MARK: - Properties
    
    private var appliedCount: Int = 1
    private var likedCount: Int = 3
    private var clickCount: Int = 27
    
    // MARK: - UI Components
    
    private let mainImageView = UIImageView()
    private let titleStackView = JobTitleStackView()
    private let dividerView = UIView()
    private let infoStackView = JobInformationStackView()
    private let describingTextView = UITextView()
    private let localInfoView = JobLocalInformingView()
    private lazy var statisticsView = JobStatisticsView(applicantsCount: appliedCount, likeCount: likedCount, clickedCount: clickCount)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainDetailView {
    
    // MARK: - UI Components Property

    private func setUI() {
        mainImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .gray
        }
        
        titleStackView.do {
            $0.configureView(part: "서빙", title: "어쩌구..서빙 한명 구합니다.", placeTime: "솝트 서울역점 · 12시간 전")
        }
        
        dividerView.do {
            $0.backgroundColor = Color.gray7
        }
        
        describingTextView.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.isEditable = false
            $0.textContainerInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            $0.isScrollEnabled = false
            $0.sizeToFit()
            $0.backgroundColor = .clear
            $0.textColor = Color.gray1
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(mainImageView, titleStackView, dividerView, infoStackView, describingTextView, localInfoView, statisticsView)
        
        mainImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(126)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(80)
        }
        
        describingTextView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(infoStackView.snp.bottom).offset(20)
        }
        
        localInfoView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(describingTextView.snp.bottom).offset(25)
            $0.height.equalTo(60)
        }
        
        statisticsView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(localInfoView.snp.bottom)
                .offset(17)
        }
    }
}

extension MainDetailView {
    
    // MARK: - Methods

    func passTextOfJobDetail(image: UIImage, text: String) {
        self.describingTextView.text = text
        self.mainImageView.image = image
    }
}
