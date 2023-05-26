//
//  PartTimeJobModel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

struct PartTimeServerModel {
    let jobName: String
    let jobImage: String
    let jobHourlyWage: Int
}

struct PartTimeJobModel {
    let jobLocation: String
    let reviewCount: String
    let jobDayWeek: String
    let jobTime: String
}

extension PartTimeJobModel {
    
    static func fetchPartTimeJobdummyData() -> [PartTimeJobModel] {
        return [
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30"),
            PartTimeJobModel(jobLocation: "데이즈호텔 명동  •  충무로 1가  •", reviewCount: "후기 1", jobDayWeek: "월~일", jobTime: "18:00 ~ 00:30")
        ]
    }
}
