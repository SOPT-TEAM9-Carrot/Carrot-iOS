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
    
    private let jobPartDescribingBoxView = UIView()
    private let jobPartDescribingLabel = UILabel()
    private let jobTitleLabel = UILabel()
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
        
        jobPartDescribingBoxView.do {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = Color.gray7
        }
        
        jobPartDescribingLabel.do {
            $0.font = UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.text = "서빙" // 네트워크에서 받아오나?
            $0.textColor = Color.gray2
            $0.textAlignment = .center
        }
        
        jobTitleLabel.do {
            $0.font = UIFont.notoSansFont(weightOf: .Bold, sizeOf: .font18)
            // $0.text = "어쩌고... 서빙 한명 구합니다..." // 네트워크에서 받아오나?
            $0.textColor = Color.gray1
            $0.textAlignment = .left
            $0.numberOfLines = 1
        }
        
        placeTimeLabel.do {
            $0.font = UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.text = "솝트 서울역점 · 12시간 전" // 네트워크에서 받아오나?
            $0.textColor = Color.gray3
            $0.textAlignment = .left
            $0.numberOfLines = 1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(jobPartDescribingBoxView, jobPartDescribingLabel, jobTitleLabel, placeTimeLabel)
        
        jobPartDescribingBoxView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview()
            $0.width.equalTo(35)
            $0.height.equalTo(28)
        }
        
        jobPartDescribingLabel.snp.makeConstraints {
            $0.center.equalTo(jobPartDescribingBoxView.snp.center)
        }
        
        jobTitleLabel.snp.makeConstraints {
            $0.top.equalTo(jobPartDescribingBoxView.snp.bottom).offset(6)
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
        self.jobPartDescribingLabel.text = part
        self.jobTitleLabel.text = title
        self.placeTimeLabel.text = placeTime
    }
}
