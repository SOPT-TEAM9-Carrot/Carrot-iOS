//
//  HomeNavigationView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationView: UIView {
    
    // MARK: - UI Components
    
    private let dismissButton = UIButton()
    private let carrotJobLabel = UILabel()
    private let profileButton = UIButton()
    private let writingButton = UIButton()
    private let searchTextField = UITextField()
    private let lineView = UIView()
    
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

extension HomeNavigationView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        dismissButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotXMark), for: .normal)
        }
        
        carrotJobLabel.do {
            $0.text = "당근알바"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        profileButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotPersonProfile), for: .normal)
        }
        
        writingButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotPencil), for: .normal)
        }
        
        searchTextField.do {
            $0.backgroundColor = Color.gray7
            $0.placeholder = "'어린이날 알바' 찾아보기"
            $0.setPlaceholderColor(placeholderColor: Color.gray5)
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.layer.cornerRadius = 6
            $0.setLeftPaddingPoints(10)
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(dismissButton, carrotJobLabel, profileButton,
                    writingButton, searchTextField, lineView)
        
        dismissButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        carrotJobLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(30)
        }
        
        writingButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints {
            $0.trailing.equalTo(writingButton.snp.leading)
            $0.top.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(dismissButton.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(36)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
