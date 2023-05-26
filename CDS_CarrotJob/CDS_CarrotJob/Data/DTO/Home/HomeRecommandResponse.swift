//
//  HomeRecommandResponse.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/26.
//

import Foundation

// MARK: - Welcome
struct RecommendResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: RecommendDataClass
    
    func convertToJob() -> [JobLocalModel] {
        return data.posts.map { JobLocalModel(jobImage: $0.image, mainInfo: $0.title, subInfo: "뉴욕 브루클린대로 7번가", moneyInfo: $0.monthlyWage, postId: $0.postID)}
    }
    
}

// MARK: - DataClass
struct RecommendDataClass: Codable {
    let nickname: String
    let posts: [RecommnedPost]
}

// MARK: - Post
struct RecommnedPost: Codable {
    let userId, postID: Int
    let title: String
    let image: String
    let monthlyWage: Int

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case postID = "postId"
        case title, image, monthlyWage
    }
}
