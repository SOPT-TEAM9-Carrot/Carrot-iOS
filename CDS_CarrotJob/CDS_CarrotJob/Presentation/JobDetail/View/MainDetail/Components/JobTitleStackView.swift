//
//  JobTitleStackView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class JobTitleStackView: UIView {
    
    // MARK: - UI Components
    
    let jobTitleLabel = UILabel()
    private let placeTimeLabel = UILabel()
    
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

extension JobTitleStackView {
    
    // MARK: - UI Components Property

    private func setUI() {
        self.backgroundColor = .clear
        
        jobTitleLabel.do {
            $0.font = UIFont.notoSansFont(weightOf: .Bold, sizeOf: .font18)
            $0.textColor = Color.gray1
            $0.textAlignment = .left
            $0.numberOfLines = 1
        }
        
        placeTimeLabel.do {
            $0.font = UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.text = ""
            $0.textColor = Color.gray3
            $0.textAlignment = .left
            $0.numberOfLines = 1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(jobTitleLabel, placeTimeLabel)
        
        jobTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        placeTimeLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(jobTitleLabel.snp.bottom).offset(4)
        }
    }
}

extension JobTitleStackView {
    
    // MARK: - Methods
    
    func configureView(part: String, title: String, placeTime: String) {
        self.jobTitleLabel.text = title
        self.placeTimeLabel.text = placeTime
    }
}
