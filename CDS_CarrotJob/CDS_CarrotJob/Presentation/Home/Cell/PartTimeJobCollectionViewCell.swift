//
//  PartTimeJobCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PartTimeJobCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let jobNameLabel = UILabel()
    private let jobLocationLabel = UILabel()
    private let advertisingButton = AdvertisingButton(buttonName: "광고", buttonImage: Image.carrotInformationCircle)
    private let reviewCountLabel = UILabel()
    private let contactStatusView = PartTimeLabel(text: "연락을 잘해줘요", textColor: Color.gray2, backgroundColor: Color.gray7)
    private let distanceTimeStatusView = PartTimeLabel(text: "걸어서 10분", textColor: Color.blue1, backgroundColor: Color.blue2)
    private let jobDayWeekLabel = UILabel()
    private let lineView = UIView()
    private let jobTimeLabel = UILabel()
    private let jobImage = UIImageView()
    private let jobHourlyWageLabel = UILabel()
    private let underLineView = UIView()
    
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

extension PartTimeJobCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        jobNameLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        jobLocationLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.textColor = Color.gray3
        }
        
        advertisingButton.do {
            $0.setTitle("광고", for: .normal)
        }
        
        reviewCountLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.mainColor1
        }
        
        jobDayWeekLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray4
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray6
        }
        
        jobTimeLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray4
        }
        
        jobImage.do {
            $0.layer.cornerRadius = 6
            $0.clipsToBounds = true
        }
        
        jobHourlyWageLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.mainColor1
        }
        
        underLineView.do {
            $0.backgroundColor = Color.gray6
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(jobNameLabel, jobLocationLabel, advertisingButton, reviewCountLabel,
                    contactStatusView, distanceTimeStatusView, jobDayWeekLabel,
                    lineView, jobTimeLabel, jobImage, jobHourlyWageLabel, underLineView)
        
        jobNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(18)
        }
        
        jobLocationLabel.snp.makeConstraints {
            $0.top.equalTo(jobNameLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(17)
            $0.height.equalTo(18)
        }
        
        advertisingButton.snp.makeConstraints {
            $0.top.equalTo(jobLocationLabel)
            $0.leading.equalTo(jobLocationLabel.snp.trailing).offset(5)
            $0.width.equalTo(40)
            $0.height.equalTo(18)
        }
        
        jobImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(70)
        }
        
        jobDayWeekLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(16)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(jobDayWeekLabel.snp.trailing).offset(8)
            $0.width.equalTo(1)
            $0.height.equalTo(11)
        }
        
        jobTimeLabel.snp.makeConstraints {
            $0.bottom.equalTo(jobDayWeekLabel)
            $0.leading.equalTo(lineView.snp.trailing).offset(8)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(jobDayWeekLabel.snp.top).offset(-5)
            $0.leading.equalTo(jobDayWeekLabel)
        }
        
        contactStatusView.snp.makeConstraints {
            $0.bottom.equalTo(jobDayWeekLabel.snp.top).offset(-2)
            $0.leading.equalTo(reviewCountLabel.snp.trailing).offset(8)
            $0.width.equalTo(90)
            $0.height.equalTo(24)
        }
        
        distanceTimeStatusView.snp.makeConstraints {
            $0.bottom.equalTo(contactStatusView)
            $0.leading.equalTo(contactStatusView.snp.trailing).offset(8)
            $0.width.equalTo(72)
            $0.height.equalTo(24)
        }
        
        jobHourlyWageLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(serverModel: PartTimeServerModel, dummyModel: PartTimeJobModel) {
        jobNameLabel.text = serverModel.jobName
        jobLocationLabel.text = dummyModel.jobLocation
        reviewCountLabel.text = dummyModel.reviewCount
        jobDayWeekLabel.text = dummyModel.jobDayWeek
        jobTimeLabel.text = dummyModel.jobTime
        jobImage.image = serverModel.jobImage
        var hourlyWage = String(serverModel.jobHourlyWage)
        if hourlyWage.count > 3 {
            hourlyWage.insert(",", at: hourlyWage.index(hourlyWage.endIndex, offsetBy: -3))
        }
        jobHourlyWageLabel.text = "시급 " + "\(hourlyWage)" + "원"
    }
}
