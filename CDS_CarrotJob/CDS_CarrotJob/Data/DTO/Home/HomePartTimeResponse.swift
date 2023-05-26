//
//  HomePartTimeResponse.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contentResponse = try? JSONDecoder().decode(ContentResponse.self, from: jsonData)

import Foundation

// MARK: - HomeNearJobResponse
struct HomePartTimeResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: HomePartTimeDataClass
    
    func convertToPartTime() -> [PartTimeServerModel] {
        return data.posts.map { PartTimeServerModel(jobName: $0.title, jobImage: $0.image, jobHourlyWage: $0.hourlyWage) }
    }
}

// MARK: - DataClass
struct HomePartTimeDataClass: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable {
    let title: String
    let image: String
    let hourlyWage: Int
}
