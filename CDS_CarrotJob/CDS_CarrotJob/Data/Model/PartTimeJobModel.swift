//
//  PartTimeJobModel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

struct PartTimeJobModel {
    let jobName: String
    let jobLocation: String
    let reviewCount: String
    let jobDayWeek: String
    let jobTime: String
    let jobImage: UIImage
    let jobHourlyWage: String
}

extension PartTimeJobModel {
    
    static func partTimeJobdummyData() -> [PartTimeJobModel] {
        return [
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000"),
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  *  충무로 1가  *  ", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000"),
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  *  충무로 1가  *  ", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000"),
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  *  충무로 1가  *  ", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000"),
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  *  충무로 1가  *  ", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000"),
            PartTimeJobModel(jobName: "데이즈호텔 프론트", jobLocation: "데이즈호텔 명동  *  충무로 1가  *  ", reviewCount: "1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30", jobImage: Image.carrotBell, jobHourlyWage: "10,000")
        ]
    }
}
