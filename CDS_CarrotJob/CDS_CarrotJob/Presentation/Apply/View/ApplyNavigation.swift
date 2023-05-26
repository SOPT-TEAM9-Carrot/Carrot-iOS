//
//  ApplyNavigation.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class ApplyNavigaitionBarView: UIView {
    
    let popButton = UIButton()
    private let profileRegister = UILabel()
    private let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coderr:) has been implenented")
    }
}

extension ApplyNavigaitionBarView {
    
    private func setUI() {
        backgroundColor = Color.white
        
        popButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotXMark), for: .normal)
        }
        profileRegister.do {
            $0.text = "프로필 등록"
            $0.textColor = Color.gray1
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        dividerView.do {
            $0.backgroundColor = Color.gray7
        }
    }
    
    private func setLayout() {
        addSubviews(popButton, profileRegister, dividerView)
        
        popButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        profileRegister.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(popButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
