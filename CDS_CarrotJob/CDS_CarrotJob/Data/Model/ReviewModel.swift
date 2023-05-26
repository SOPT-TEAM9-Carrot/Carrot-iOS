//
//  ReviewModel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/18.
//

import UIKit

struct ReviewServerModel {
    let profileImage: String
    let nickName: String
    let comment: String
}

struct ReviewModel {
    let certificationCount: String
    let monthAgo: String
    let jobTitle: String
}

extension ReviewModel {
    
    static func fetchReviewModelDummyData() -> [ReviewModel] {
        return [
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀")
        ]
    }
}
