//
//  CategoryCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/25.
//

import UIKit

import SnapKit
import Then

final class CategoryCollectionViewCell: UICollectionViewCell {
    private let categoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCollectionViewCell {

    private func setUI() {
        self.backgroundColor = Color.gray7
        
        categoryLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.textColor = Color.gray2
            $0.sizeToFit()
        }
    }
    
    private func setLayout() {
        self.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension CategoryCollectionViewCell {
    func configureCell(category: String) {
        self.categoryLabel.text = category
    }
}
