//
//  JobInformationStackView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class JobInformationStackView: UIView {
    
    // MARK: - UI Components
    
    let hourlyWageLabel = LabelWithImage()
    private let workingDaysLabel = LabelWithImage()
    private let workingHoursLabel = LabelWithImage()
    
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
    
extension JobInformationStackView {
    
    // MARK: - UI Components Property

    private func setUI() {
        self.backgroundColor = .clear
        
        hourlyWageLabel.do {
            $0.configureSymbolImage(image: UIImage.loadImageOf(carrotImageName: .carrotCoin))
        }
        
        workingDaysLabel.do {
            $0.configureTexts(text: "월,금,토,일")
            $0.configureSymbolImage(image: UIImage.loadImageOf(carrotImageName: .carrotCalendar))
        }
        
        workingHoursLabel.do {
            $0.configureTexts(text: "18:00 ~ 00:30")
            $0.configureSymbolImage(image: UIImage.loadImageOf(carrotImageName: .carrotClock))
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(hourlyWageLabel, workingDaysLabel, workingHoursLabel)
        
        hourlyWageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        workingDaysLabel.snp.makeConstraints {
            $0.top.equalTo(hourlyWageLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        workingHoursLabel.snp.makeConstraints {
            $0.top.equalTo(workingDaysLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
    }
}
