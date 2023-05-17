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
    
    let jobImage = UIImageView()
    let mainInfo = UILabel()
    let subInfo = UILabel()
    let moneyInfo = UILabel()
    
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
        layer.borderColor = UIColor(named: "gray7")?.cgColor
        
        mainInfo.do {
            $0.textColor = .black
            $0.numberOfLines = 2
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        }
        subInfo.do {
            $0.textColor = .gray
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
        }
        moneyInfo.do {
            $0.textColor = .orange
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
        }
    }
    
    func setLayout() {
        contentView.addSubview(jobImage)
        contentView.addSubview(mainInfo)
        contentView.addSubview(subInfo)
        contentView.addSubview(moneyInfo)
        
        jobImage.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        mainInfo.snp.makeConstraints {
            $0.top.equalTo(jobImage.snp.bottom).offset(8)
            $0.width.equalTo(133)
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        subInfo.snp.makeConstraints {
            $0.top.equalTo(mainInfo.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        moneyInfo.snp.makeConstraints {
            $0.top.equalTo(subInfo.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension HomeLocalJobCollectionViewCell {
    func configureCell(model: Job) {
        self.jobImage.image = model.jobImage
        self.mainInfo.text = model.mainInfo
        self.subInfo.text = model.subInfo
        self.moneyInfo.text = model.moneyInfo
    }
}
