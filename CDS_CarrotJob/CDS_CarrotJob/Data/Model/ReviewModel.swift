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

extension ReviewServerModel {
    
    static func reviewServerData() -> [ReviewServerModel] {
        return [
            ReviewServerModel(profileImage: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/24/6cff806a-82ef-4a54-a7ba-acd0ced51ba6.jpg", nickName: "착한 당근이", comment: "바쁘지만 시간이 금방 가고 좋아요 !!"),
            ReviewServerModel(profileImage: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/24/6cff806a-82ef-4a54-a7ba-acd0ced51ba6.jpg", nickName: "착한 규보오빠", comment: "머싯는 규보 오빠 화이텡 ~~!!"),
            ReviewServerModel(profileImage: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/24/6cff806a-82ef-4a54-a7ba-acd0ced51ba6.jpg", nickName: "착한 동현이", comment: "동현이 머싯다 잘하고 있따 !!!!!"),
            ReviewServerModel(profileImage: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/24/6cff806a-82ef-4a54-a7ba-acd0ced51ba6.jpg", nickName: "권 정 권정", comment: "알바 가기 너무 싫어요"),
            ReviewServerModel(profileImage: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/24/6cff806a-82ef-4a54-a7ba-acd0ced51ba6.jpg", nickName: "착한 당근이", comment: "바쁘지만 시간이 금방 가고 좋아요 !!")
        ]
    }
}

extension ReviewModel {
    
    static func reviewModelDummyData() -> [ReviewModel] {
        return [
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀"),
            ReviewModel(certificationCount: "인계동 인증 29회  •", monthAgo: "2개월 전", jobTitle: "[알바급구] 인계동 단기 오늘!! 금(10) 홀")
        ]
    }
}
