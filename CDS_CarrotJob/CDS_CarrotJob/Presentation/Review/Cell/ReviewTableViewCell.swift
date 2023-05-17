//
//  ReviewTableViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class ReviewTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let profileImage = UIImageView()
    private let userName = UILabel()
    private let actualWorkLabel = UILabel()
    private let certificationsCountLabel = UILabel()
    private let monthAgoLabel = UILabel()
    private let reviewLabel = UILabel()
    private let jobLabel = UILabel()
    private let jobTitle = UILabel()

    // MARK: - View Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReviewTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        profileImage.do {
            $0.image = Image.carrotPersonProfile
        }
        
        userName.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        actualWorkLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.mainColor1
        }
        
        certificationsCountLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
        
        monthAgoLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
        
        reviewLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        jobLabel.do {
            $0.backgroundColor = Color.gray7
            $0.text = "알바"
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font10)
            $0.textColor = Color.gray2
            $0.textAlignment = .center
            $0.layer.cornerRadius = 2
            $0.clipsToBounds = true
        }
        
        jobTitle.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
}
