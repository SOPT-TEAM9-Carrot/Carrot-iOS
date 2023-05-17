//
//  PartTimeJobModel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

struct PartTimeServerModel {
    let jobName: String
    let jobImage: UIImage
    let jobHourlyWage: Int
}

struct PartTimeJobModel {
//    let jobName: String
    let jobLocation: String
    let reviewCount: String
    let jobDayWeek: String
    let jobTime: String
//    let jobImage: UIImage
//    let jobHourlyWage: String
}

extension PartTimeServerModel {
    
    static func partTimeJobServerData() -> [PartTimeServerModel] {
        return [
            PartTimeServerModel(jobName: "데이즈호텔 프론트", jobImage: Image.carrotBell, jobHourlyWage: 10000),
            PartTimeServerModel(jobName: "데이즈호텔 프론트", jobImage: Image.carrotBell, jobHourlyWage: 10000),
            PartTimeServerModel(jobName: "데이즈호텔 프론트", jobImage: Image.carrotBell, jobHourlyWage: 10000),
            PartTimeServerModel(jobName: "데이즈호텔 프론트", jobImage: Image.carrotBell, jobHourlyWage: 10000),
            PartTimeServerModel(jobName: "데이즈호텔 프론트", jobImage: Image.carrotBell, jobHourlyWage: 10000)
        ]
    }
}

extension PartTimeJobModel {
    
    static func partTimeJobdummyData() -> [PartTimeJobModel] {
        return [
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30")
        ]
    }
}