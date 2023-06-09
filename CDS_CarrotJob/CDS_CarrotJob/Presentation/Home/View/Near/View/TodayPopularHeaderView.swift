//
//  TodayPopularHeaderView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/23.
//

import UIKit

import SnapKit
import Then

final class TodayPopularHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let sectionLineView = UIView()
    private let starIcon = UIImageView()
    private let todayPopularLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayPopularHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        sectionLineView.do {
            $0.backgroundColor = Color.gray7
        }
        
        starIcon.do {
            $0.image = Image.carrotStar
        }
        
        todayPopularLabel.do {
            $0.text = "오늘의 인기 알바"
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.textColor = Color.gray1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(sectionLineView, starIcon, todayPopularLabel)
        
        sectionLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(6)
        }
        
        starIcon.snp.makeConstraints {
            $0.top.equalTo(sectionLineView.snp.bottom).offset(9)
            $0.leading.equalToSuperview()
        }
        
        todayPopularLabel.snp.makeConstraints {
            $0.top.equalTo(sectionLineView.snp.bottom).offset(18)
            $0.leading.equalTo(starIcon.snp.trailing)
            $0.height.equalTo(26)
        }
    }
    
    // MARK: - Methods
   
}
