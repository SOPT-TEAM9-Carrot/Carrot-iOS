//
//  TodayPopularCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/23.
//

import UIKit

import SnapKit
import Then

final class TodayPopularCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let jobNameLabel = UILabel()
    private let jobPlace = UILabel()
    private let attentionLabel = UILabel()
    private let inquiryLabel = UILabel()
    private let hourlyWageLabel = UILabel()
    
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

extension TodayPopularCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        self.layer.cornerRadius = 8
        self.layer.shadowColor = Color.gray1.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
//        self.clipsToBounds = true
        
        titleLabel.do {
            $0.text = "1위  카페운영및관리.\n광고홍보.멀티되..."
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
            $0.numberOfLines = 2
            $0.partColorChange(targetString: "1위", textColor: Color.mainColor1)
        }
        
        jobNameLabel.do {
            $0.text = "오랑제뜨21"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.textColor = Color.gray3
        }
        
        jobPlace.do {
            $0.text = "연남동"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.textColor = Color.gray3
        }
        
        attentionLabel.do {
            $0.text = "관심 2"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.textColor = Color.gray3
        }
        
        inquiryLabel.do {
            $0.text = "관심 2"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.textColor = Color.gray3
        }
        
        hourlyWageLabel.do {
            $0.text = "10,000원"
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.mainColor1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(titleLabel, jobNameLabel, jobPlace,
                    attentionLabel, inquiryLabel, hourlyWageLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(14)
            $0.height.equalTo(41)
        }
        
        jobNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(18)
        }
        
        jobPlace.snp.makeConstraints {
            $0.top.equalTo(jobNameLabel)
            $0.leading.equalTo(jobNameLabel.snp.trailing).offset(13)
            $0.height.equalTo(18)
        }
        
        inquiryLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(16)
        }
        
        attentionLabel.snp.makeConstraints {
            $0.bottom.equalTo(inquiryLabel.snp.top)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(16)
        }
        
        hourlyWageLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(20)
        }
    }
    
    // MARK: - Methods

}
