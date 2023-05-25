//
//  EmployerProfileStackView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class EmployerProfileStackView: UIView {
    
    private var temperature: CGFloat = 0.0
    
    private let mainLabel = UILabel()
    private let employerProfileImageView = UIImageView()
    private let employerNameLabel = UILabel()
    private let employerPlaceCertifiedCountLabel = UILabel()
    private let labelStackView = UIStackView()
    
    private let temperatureLabel = UILabel()
    private let temperatureProgressView = UIProgressView(progressViewStyle: .bar)
    private let faceImageView = UIImageView()
    private let mannerLabel = UILabel()
    private let mannerUnderLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setAnimation()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        temperatureProgressView.subviews.forEach {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
        }
        
        employerProfileImageView.layer.cornerRadius = self.employerProfileImageView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmployerProfileStackView {

    private func setUI() {
        mainLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.textColor = Color.gray1
        }
        
        employerProfileImageView.do {
            $0.image = UIImage.loadImageOf(carrotImageName: .employerProfile)
            $0.contentMode = .scaleAspectFill
            $0.layer.masksToBounds = true
        }
        
        employerNameLabel.do {
            $0.textColor = Color.gray1
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        
        employerPlaceCertifiedCountLabel.do {
            $0.text = "서울 종로구 인증 5회"
            $0.textColor = Color.gray3
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 2
        }
        
        temperatureLabel.do {
            $0.text = "36.8°C"
            $0.textColor = Color.mainColor1
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        
        temperatureProgressView.do {
            $0.trackTintColor = Color.mainColor2
            $0.progressTintColor = Color.mainColor1
            $0.setProgress(0.368, animated: true)
        }
        
        faceImageView.do {
            $0.image = UIImage.loadImageOf(carrotImageName: .carrotFace)
            $0.contentMode = .scaleToFill
        }
        
        mannerLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.textColor = Color.gray3
            $0.text = "매너온도"
            $0.isUserInteractionEnabled = true
        }
        
        mannerUnderLineView.do {
            $0.backgroundColor = Color.gray3
            $0.isUserInteractionEnabled = true
        }
    }
    
    private func setLayout() {
        self.addSubviews(mainLabel, employerProfileImageView, labelStackView, faceImageView, temperatureLabel, temperatureProgressView, mannerLabel, mannerUnderLineView)
        
        labelStackView.addArrangedSubviews(employerNameLabel, employerPlaceCertifiedCountLabel)
        
        mainLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        employerProfileImageView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(employerProfileImageView.snp.trailing).offset(14)
            $0.centerY.equalTo(employerProfileImageView.snp.centerY)
        }
        
        faceImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(labelStackView.snp.top).offset(-2)
            $0.size.equalTo(22)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(labelStackView.snp.top).offset(-2)
            $0.trailing.equalTo(faceImageView.snp.leading).offset(-7)
        }
        
        temperatureProgressView.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(2)
            $0.width.equalTo(temperatureLabel.snp.width)
            $0.centerX.equalTo(temperatureLabel.snp.centerX)
            $0.height.equalTo(3)
        }
        
        mannerLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(7)
            $0.top.equalTo(temperatureProgressView.snp.bottom).offset(4)
        }
        
        mannerUnderLineView.snp.makeConstraints {
            $0.width.equalTo(mannerLabel.snp.width)
            $0.top.equalTo(mannerLabel.snp.bottom).offset(1)
            $0.height.equalTo(1)
            $0.centerX.equalTo(mannerLabel.snp.centerX)
        }
    }
    
    private func setAnimation() {
        let mannerTapped = UITapGestureRecognizer(target: self, action: #selector(progressAnimation))
        mannerLabel.addGestureRecognizer(mannerTapped)
    }
    
    @objc
    private func progressAnimation() {
        self.temperatureProgressView.setProgress(0, animated: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.temperatureProgressView.setProgress(Float(self.temperature), animated: true)
        }
    }
}

extension EmployerProfileStackView {
    func configureView(imageString: String, employerName: String, temperature: CGFloat) {
        guard let url = URL(string: imageString) else { return }
        let degree: CGFloat = temperature / 100
        
        employerProfileImageView.load(url: url)
        employerNameLabel.text = employerName
        temperatureLabel.text = "\(temperature)°C"
        self.temperature = degree
        temperatureProgressView.setProgress(Float(degree), animated: true)
        mainLabel.text = "\(employerName)님이 구인 중이에요"
    }
}
