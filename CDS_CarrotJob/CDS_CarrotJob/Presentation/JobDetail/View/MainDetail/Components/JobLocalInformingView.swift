//
//  JobLocalInformingView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class JobLocalInformingView: UIView {
    
    // MARK: - UI Components
    
    private let alarmImageView = UIImageView()
    private let mainLabel = UILabel()
    private let subLabel = UILabel()
    private let chevronImageView = UIImageView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    // MARK: - Draw Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
extension JobLocalInformingView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        self.backgroundColor = Color.mainColor3
        
        alarmImageView.do {
            $0.image = UIImage.loadImageOf(carrotImageName: .carrotBell)
            $0.contentMode = .scaleAspectFit
        }
        
        mainLabel.do {
            $0.text = "OOO동 알바 찾으세요?"
            $0.textColor = Color.gray1
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
        }
        
        subLabel.do {
            $0.text = "이 공고와 비슷한 공고가 새로 올라오면 알려드려요."
            $0.textColor = Color.gray1
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.numberOfLines = 1
        }
        
        chevronImageView.do {
            $0.image = UIImage.loadImageOf(carrotImageName: .carrotChervonRight)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(alarmImageView, mainLabel, subLabel, chevronImageView)
        
        alarmImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalTo(alarmImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(12)
        }
        
        subLabel.snp.makeConstraints {
            $0.leading.equalTo(mainLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
