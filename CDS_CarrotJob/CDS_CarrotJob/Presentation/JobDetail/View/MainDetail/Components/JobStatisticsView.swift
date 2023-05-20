//
//  JobStatisticsView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class JobStatisticsView: UIView {
    
    // MARK: - Properties
    
    private var applicantsCount: Int
    private var likeCount: Int
    private var clickedCount: Int
    
    // MARK: - UI Components
    
    private let mainLabel = UILabel()
    
    // MARK: - Initializer
    
    init(applicantsCount: Int, likeCount: Int, clickedCount: Int) {
        self.applicantsCount = applicantsCount
        self.likeCount = likeCount
        self.clickedCount = clickedCount
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobStatisticsView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        mainLabel.do {
            $0.text = "지원자 \(self.applicantsCount) · 관심 \(self.likeCount) · 조회 \(self.clickedCount)"
            $0.textColor = Color.gray3
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.textAlignment = .left
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
