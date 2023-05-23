//
//  JobLabelFooterView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/23.
//

import UIKit

import SnapKit
import Then

final class JobLabelFooterView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let jobAlarmLabel = UILabel()
    private let alarmSetting = UIButton()
    private let alarmView = UIView()
    private let applyImageView = UIImageView()
    
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

extension JobLabelFooterView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        jobAlarmLabel.do {
            $0.text = "원하는 알바를 알림으로 받아보세요"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray2
        }
        
        alarmSetting.do {
            $0.setTitle("알림설정", for: .normal)
            $0.setTitleColor(Color.gray1, for: .normal)
            $0.titleLabel?.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        
        alarmView.do {
            $0.backgroundColor = Color.gray7
        }
        
        applyImageView.do {
            $0.image = Image.carrotApplyImage
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        alarmView.addSubviews(jobAlarmLabel, alarmSetting)
        addSubviews(alarmView, applyImageView)
        
        jobAlarmLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        alarmSetting.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(52)
            $0.height.equalTo(20)
        }
        
        alarmView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        applyImageView.snp.makeConstraints {
            $0.top.equalTo(alarmView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(alarmView)
            $0.height.equalTo(106)
        }
    }
    
    // MARK: - Methods
   
}
