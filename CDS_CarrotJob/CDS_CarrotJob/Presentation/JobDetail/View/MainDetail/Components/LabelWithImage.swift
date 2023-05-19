//
//  LabelWithImage.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class LabelWithImage: UIView {
    
    // MARK: - UI Components
    
    private let symbolImageView = UIImageView()
    private let textLabel = UILabel()
    
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

extension LabelWithImage {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        symbolImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        textLabel.do {
            $0.textColor = Color.gray1
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(symbolImageView, textLabel)
        
        symbolImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.size.equalTo(14)
            $0.centerY.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints {
            $0.leading.equalTo(symbolImageView.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
    }
}

extension LabelWithImage {
    
    // MARK: - Methods

    func configureTexts(textColor: UIColor = Color.gray1, textWeight: UIFont.NotoSansFamily = .Medium, textSize: UIFont.NotoSansFontSize = .font14, text: String) {
        self.textLabel.textColor = textColor
        self.textLabel.font = UIFont.notoSansFont(weightOf: textWeight, sizeOf: textSize)
        self.textLabel.text = text
    }
    
    func configureSymbolImage(image: UIImage) {
        self.symbolImageView.image = image
    }
}
