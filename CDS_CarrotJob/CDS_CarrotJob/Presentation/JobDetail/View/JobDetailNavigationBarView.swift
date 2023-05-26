//
//  JobDetailNavigationBarView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class JobDetailNavigationBarView: UIView {
    
    // MARK: - UI Components
    
    let popButton = UIButton()
    private let shareButton = UIButton()
    private let reportButton = UIButton()
    private let dividerView = UIView()
    
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

extension JobDetailNavigationBarView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = Color.white
        
        popButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotNavigationBack), for: .normal)
        }
        
        shareButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotShare), for: .normal)
        }
        
        reportButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotDeclaration), for: .normal)
        }
        
        dividerView.do {
            $0.backgroundColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(popButton, shareButton,
                    reportButton, dividerView)
        
        popButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        reportButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalTo(reportButton.snp.leading)
            $0.top.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(popButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
