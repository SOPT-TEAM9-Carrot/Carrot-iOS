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
    
    private let mediumConfig = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular, scale: .default)
    private let titleLabel = UILabel()
    private let titleImage = NSTextAttachment()
    private let calenderImage = NSTextAttachment()
//    private let calender = UIImage(systemName: "calender", withConfiguration: mediumConfig)!
    
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
        
        calenderImage.do {
            $0.image = UIImage(systemName: "calender")
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
        let img = NSAttributedString(attachment: titleImage)
        // 도데체 왜 이 spacing이 적용이안되는지 도무지도무지 정말 모르겠어여
        titleLabel.labelWithImg(composition: string, img, spacing: 6)
    }
    
    func setCalendarDataBind(model: JobLabelModel) {
        let string = NSMutableAttributedString(string: "  " + model.title)
        let mediumConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular, scale: .default)
        let calendarImage = UIImage(systemName: "calendar", withConfiguration: mediumConfig)?.withTintColor(Color.gray2)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = calendarImage
        let imageString = NSAttributedString(attachment: imageAttachment)
        string.insert(imageString, at: 0)
        titleLabel.labelWithImg(composition: string, spacing: 6)
    }

    private func setImageColor(_ isSelected: Bool) {
        if isSelected {
            titleImage.image = Image.whiteArrow
        } else {
            titleImage.image = Image.blackArrow
        }
    }
    
    private func setCalenderColor(_ isSelected: Bool) {
        if isSelected {
            calenderImage.image?.withTintColor(Color.white)
        } else {
            calenderImage.image?.withTintColor(Color.gray2)
        }
    }
    
    func updateCellColor(_ isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = Color.mainColor1
            titleLabel.textColor = Color.white
            layer.borderWidth = 0
            setImageColor(isSelected)
            setCalenderColor(isSelected)
        } else {
            contentView.backgroundColor = Color.white
            titleLabel.textColor = Color.gray1
            layer.borderWidth = 1
            setImageColor(isSelected)
            setCalenderColor(isSelected)
        }
    }
}
