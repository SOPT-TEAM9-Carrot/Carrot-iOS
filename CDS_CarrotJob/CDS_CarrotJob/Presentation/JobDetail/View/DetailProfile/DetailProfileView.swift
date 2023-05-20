//
//  DetailProfileView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class DetailProfileView: UIView {

    private let kakaoMapView = KaKaoMapView()
    private let profileMainTitle = UILabel()
    private let employerProfileView = EmployerProfileStackView()
    
    private let employerResponseRatioLabel = LabelWithImage()
    private let employerUsedSinceLabel = LabelWithImage()
    private let employerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailProfileView {
    
    private func setUI() {
        kakaoMapView.do {
            $0.passAddress(address: "서울 종로구 창경궁로 230")
        }
        
        profileMainTitle.do {
            $0.text = "솝트님이 구인 중이에요"
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.textColor = Color.gray1
        }
        
        employerProfileView.do {
            $0.backgroundColor = .clear
        }
        
        employerResponseRatioLabel.do {
            $0.configureSymbolImage(image: UIImage.loadImageOf(carrotImageName: .carrotTalkBubble))
            $0.configureTexts(textColor: Color.gray3, textWeight: .Medium, textSize: .font12, text: "알바 응답률 46% 이상")
        }
        
        employerUsedSinceLabel.do {
            $0.configureSymbolImage(image: UIImage.loadImageOf(carrotImageName: .carrotCalendarFill))
            $0.configureTexts(textColor: Color.gray3, textWeight: .Medium, textSize: .font12, text: "당근 알바 2022년 4월부터 이용중")
        }
        
        employerStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.spacing = 6
        }
    }
    
    private func setLayout() {
        self.addSubviews(kakaoMapView, profileMainTitle, employerProfileView, employerStackView)
        employerStackView.addArrangedSubviews(employerResponseRatioLabel, employerUsedSinceLabel)
        
        kakaoMapView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(170)
        }
        
        profileMainTitle.snp.makeConstraints {
            $0.top.equalTo(kakaoMapView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
        }
        
        employerProfileView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(profileMainTitle.snp.bottom).offset(22)
            $0.height.equalTo(50)
        }
        
        employerStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(46)
            $0.top.equalTo(employerProfileView.snp.bottom).offset(15)
        }
        
        employerResponseRatioLabel.snp.makeConstraints {
            $0.top.equalTo(employerStackView.snp.top)
            $0.height.equalTo(14)
        }
    }
}
