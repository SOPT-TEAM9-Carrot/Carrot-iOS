//
//  HomeLocalJobCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/16.
//


import UIKit

import Alamofire
import Kingfisher
import SnapKit
import Then

class HomeLocalJobCollectionViewCell: UICollectionViewCell {
    
    let jobImageView = UIImageView()
    let mainInfoLabel = UILabel()
    let subInfoLabel = UILabel()
    let moneyInfoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.borderColor = Color.gray7.cgColor
        
        mainInfoLabel.do {
            $0.textColor = Color.gray1
            $0.numberOfLines = 2
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        subInfoLabel.do {
            $0.textColor = .gray
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
        }
        moneyInfoLabel.do {
            $0.textColor = .orange
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
        }
    }
    
    func setLayout() {
        contentView.addSubviews(jobImageView, mainInfoLabel, subInfoLabel, moneyInfoLabel)
        
        jobImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        mainInfoLabel.snp.makeConstraints {
            $0.top.equalTo(jobImageView.snp.bottom).offset(8)
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        subInfoLabel.snp.makeConstraints {
            $0.top.equalTo(mainInfoLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        moneyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(subInfoLabel.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}

extension HomeLocalJobCollectionViewCell {
    func configureCell(model: JobLocalModel) {
        self.jobImageView.image = model.jobImage
        self.mainInfoLabel.text = model.mainInfo
        self.subInfoLabel.text = model.subInfo
        self.moneyInfoLabel.text = model.moneyInfo
    }
}
