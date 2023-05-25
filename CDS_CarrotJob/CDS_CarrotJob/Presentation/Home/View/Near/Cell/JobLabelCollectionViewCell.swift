//
//  JobLabelCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class JobLabelCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            updateCellColor(isSelected)
        }
    }
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let titleImage = NSTextAttachment()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        self.updateCellColor(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobLabelCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        contentView.backgroundColor = Color.white
        self.layer.cornerRadius = 15
        self.layer.borderColor = Color.gray6.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        titleLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
            $0.textAlignment = .center
        }
        
        titleImage.do {
            $0.image = Image.blackArrow
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(20)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: JobLabelModel) {
        let string = NSMutableAttributedString(string: model.title + "  ")
        setImageColor(isSelected)
        let img = NSAttributedString(attachment: titleImage)
        // 도데체 왜 이 spacing이 적용이안되는지 도무지도무지 정말 모르겠어여
        titleLabel.labelWithImg(composition: string, img, spacing: 6)
    }
    
    private func setImageColor(_ isSelected: Bool) {
        if isSelected {
            titleImage.image = Image.whiteArrow
        } else {
            titleImage.image = Image.blackArrow
        }
    }
    
    func updateCellColor(_ isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = Color.mainColor1
            titleLabel.textColor = Color.white
            layer.borderWidth = 0
            setImageColor(isSelected)
        } else {
            contentView.backgroundColor = Color.white
            titleLabel.textColor = Color.gray1
            layer.borderWidth = 1
            setImageColor(isSelected)
        }
    }
}
