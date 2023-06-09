//
//  ExitPopupView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/06/09.
//

import UIKit

import SnapKit
import Then

protocol ButtonTypeProtocol: AnyObject {
    func buttonType(type: ApplyButtonType)
}

final class ExitPopupView: UIView {
    
    // MARK: - UI Components
    
    private let exitPopupView = UIView()
    private let iconLabel = UILabel()
    private let exitLabel = UILabel()
    private let exitDiscriptionLabel = UILabel()
    private let buttonView = UIStackView()
    private let cancelButton = UIButton()
    private let exitButton = UIButton()
    
    // MARK: - Properties
    
    weak var delegate: (ButtonTypeProtocol)?
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExitPopupView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.gray1.withAlphaComponent(0.5)
        
        exitPopupView.do {
            $0.backgroundColor = Color.white
            $0.layer.cornerRadius = 13
            $0.clipsToBounds = true
        }
        
        iconLabel.do {
            $0.text = "✋"
            $0.font = .boldSystemFont(ofSize: 24)
        }
        
        exitLabel.do {
            $0.text = "지금 나가시면\n작성하신 정보가 삭제됩니다."
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font18)
            $0.textColor = Color.gray1
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        exitDiscriptionLabel.do {
            $0.text = "나가시면 작성하신 정보가\n삭제됩니다. 그래도 나가시겠습니까?"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray1
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        
        buttonView.do {
            $0.backgroundColor = .clear
            $0.spacing = 6
            $0.distribution = .equalCentering
            $0.alignment = .trailing
        }
        
        cancelButton.do {
            $0.setTitle("취소", for: .normal)
            $0.backgroundColor = Color.gray7
            $0.setTitleColor(Color.gray4, for: .normal)
            $0.titleLabel?.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.layer.cornerRadius = 5
        }
        
        exitButton.do {
            $0.setTitle("나가기", for: .normal)
            $0.backgroundColor = Color.mainColor1
            $0.setTitleColor(Color.white, for: .normal)
            $0.titleLabel?.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        buttonView.addArrangedSubviews(cancelButton, exitButton)
        exitPopupView.addSubviews(iconLabel, exitLabel, exitDiscriptionLabel, buttonView)
        addSubviews(exitPopupView)
        
        exitPopupView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(280)
            $0.height.equalTo(253)
        }
        
        iconLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(23)
            $0.height.equalTo(31)
        }
        
        exitLabel.snp.makeConstraints {
            $0.top.equalTo(iconLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        exitDiscriptionLabel.snp.makeConstraints {
            $0.top.equalTo(exitLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(23)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(40)
        }
        
        exitButton.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(exitButtonDidTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    func cancelButtonDidTapped() {
        delegate?.buttonType(type: .cancel)
    }
    
    @objc
    func exitButtonDidTapped() {
        delegate?.buttonType(type: .exit)
    }
}
