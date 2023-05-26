//
//  BottomStickyView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class BottomStickyView: UIView {
    
    private var isHeartTapped: Bool = false {
        didSet {
            if isHeartTapped == false {
                heartButton.setImage(UIImage.loadImageOf(carrotImageName: .carrotHeart), for: .normal)
            } else {
                heartButton.setImage(UIImage.loadImageOf(carrotImageName: .carrotHeartFill), for: .normal)
            }
        }
    }

    private let dividerView = UIView()
    private let heartButton = UIButton()
    private let callButton = OrangeUIButton()
    let applyButton = OrangeUIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomStickyView {
    
    private func setUI() {
        self.backgroundColor = .white
        
        dividerView.do {
            $0.backgroundColor = Color.gray7
        }
        
        heartButton.do {
            $0.contentMode = .scaleAspectFit
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotHeart), for: .normal)
            $0.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
            $0.adjustsImageWhenHighlighted = false
        }
        
        callButton.do {
            $0.setUIOfButtonFor(type: .inquireOnThePhone)
        }
        
        applyButton.do {
            $0.setUIOfButtonFor(type: .apply)
        }
    }
    
    private func setLayout() {
        self.addSubviews(dividerView, callButton, applyButton, heartButton)
        
        dividerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
        }
        
        callButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(48)
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        
        applyButton.snp.makeConstraints {
            $0.leading.equalTo(callButton.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        
        heartButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalTo(callButton.snp.centerY)
        }
    }
}

extension BottomStickyView {
    @objc
    private func heartTapped() {
        isHeartTapped.toggle()
    }
}
