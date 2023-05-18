//
//  ReviewTableViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/17.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class ReviewTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let profileImage = UIImageView()
    private let nickNameLabel = UILabel()
    private let actualWorkLabel = UILabel()
    private let certificationsCountLabel = UILabel()
    private let monthAgoLabel = UILabel()
    private let commentLabel = UILabel()
    private let jobLabel = UILabel()
    private let jobTitle = UILabel()
    private let underLineView = UIView()

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
            $0.layer.cornerRadius = 17
            $0.clipsToBounds = true
        }
        
        nickNameLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        actualWorkLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.mainColor1
            $0.text = "실제근무"
        }
        
        certificationsCountLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
        
        monthAgoLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
        
        commentLabel.do {
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
        
        underLineView.do {
            $0.backgroundColor = Color.gray6
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(profileImage, nickNameLabel, actualWorkLabel,
                    certificationsCountLabel, monthAgoLabel,
                    commentLabel, jobLabel, jobTitle, underLineView)
        
        profileImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(36)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(14)
            $0.height.equalTo(20)
        }
        
        actualWorkLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom)
            $0.leading.equalTo(nickNameLabel)
            $0.height.equalTo(20)
        }
        
        certificationsCountLabel.snp.makeConstraints {
            $0.top.equalTo(actualWorkLabel.snp.bottom)
            $0.leading.equalTo(nickNameLabel)
            $0.height.equalTo(20)
        }
        
        monthAgoLabel.snp.makeConstraints {
            $0.top.equalTo(certificationsCountLabel)
            $0.leading.equalTo(certificationsCountLabel.snp.trailing).offset(5)
            $0.height.equalTo(20)
        }
        
        jobLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(17)
            $0.leading.equalTo(nickNameLabel)
            $0.width.equalTo(23)
            $0.height.equalTo(16)
        }
        
        jobTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(jobLabel.snp.trailing).offset(4)
            $0.height.equalTo(20)
        }
        
        commentLabel.snp.makeConstraints {
            $0.bottom.equalTo(jobTitle.snp.top)
            $0.leading.equalTo(nickNameLabel)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(serverModel: ReviewServerModel, dummyModel: ReviewModel) {
        guard let url = URL(string: serverModel.profileImage) else { return }
        profileImage.kf.setImage(with: url)
        nickNameLabel.text = serverModel.nickName
        commentLabel.text = serverModel.comment
        certificationsCountLabel.text = dummyModel.certificationCount
        monthAgoLabel.text = dummyModel.monthAgo
        jobTitle.text = dummyModel.jobTitle
    }
}
