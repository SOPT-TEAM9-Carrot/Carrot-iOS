//
//  ReviewResponse.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contentResponse = try? JSONDecoder().decode(ContentResponse.self, from: jsonData)

import Foundation

// MARK: - ContentResponse
struct ReviewResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: ReviewDataClass
    
    func convertToReview() -> [ReviewServerModel] {
        return data.reviews.map { ReviewServerModel(profileImage: $0.imageURL, nickName: $0.reviewerName, comment: $0.comment)}
    }
}

// MARK: - DataClass
struct ReviewDataClass: Codable {
    let userId: Int
    let nickname: String
    let imageURL: String
    let degree: Double
    let reviews: [Review]

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case nickname
        case imageURL = "imageUrl"
        case degree, reviews
    }
}

// MARK: - Review
struct Review: Codable {
    let reviewerName, comment: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case reviewerName, comment
        case imageURL = "imageUrl"
    }
}
