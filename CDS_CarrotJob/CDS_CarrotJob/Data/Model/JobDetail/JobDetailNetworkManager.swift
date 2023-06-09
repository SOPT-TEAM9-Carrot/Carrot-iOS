//
//  JobDetailNetworkManager.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/23.
//

import Foundation

import Alamofire

// MARK: - MainDetail, Profile
struct JobDetailListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: JobDetailModel
}

struct JobDetailModel: Codable {
    var userId: Int
    var image: String
    var categories: [String]
    var title: String
    var hourlyWage: Int
    var content, address: String
}

// MARK: - LocalList
struct JobListsModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: JobPostsModel
}

struct JobPostsModel: Codable {
    var posts: [PostModel]
}

struct PostModel: Codable {
    var title: String
    var image: String
    var hourlyWage: Int
}

// MARK: - Reviews
struct JobReviewListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: ReviewsListModel
}

struct ReviewsListModel: Codable {
    var userID: Int
    var nickname: String
    var imageURL: String
    var degree: Double
    var reviews: [DetailReviewModel]
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
        case imageURL = "imageUrl"
        case degree, reviews
    }
}

struct DetailReviewModel: Codable {
    var reviewerName, comment: String
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case reviewerName, comment
        case imageURL = "imageUrl"
    }
}

struct CustomReviewModel {
    var jobTitle: String
    var reviewerName: String
    var comment: String
    var imageURL: String
}

final class JobDetailGeneralDataManager: JobDetailNetworkServiceProtocol {
    typealias PostId = Int
    
    func fetchDetailData(requestId: PostId, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/posts" + "/\(requestId)"
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "2"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return }
                guard let data = response.value else { return }
                let networkResult = self.judgeStatus(modelType: JobDetailListModel.self, by: statusCode, data)
                
                completion(networkResult)
            default:
                completion(.networkErr)
            }
        }
    }
}

final class JobDetailLocalJobsDataManager: JobDetailNetworkServiceProtocol {
    
    typealias PostCount = Int
    
    func fetchDetailData(requestId: PostCount, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/posts" + "/list?size=\(requestId)"
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "2"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.value else { return }
                
                let networkResult = self.judgeStatus(modelType: JobListsModel.self, by: statusCode, data)
                completion(networkResult)
            default:
                completion(.networkErr)
            }
        }
    }
}

final class JobDetailReviewsDataManager: JobDetailNetworkServiceProtocol {
    
    typealias EmployerId = Int
    
    func fetchDetailData(requestId: EmployerId, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/employer" + "/\(requestId)" + "/reviews?size=3"
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "2"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.value else { return }
                
                let networkResult = self.judgeStatus(modelType: JobReviewListModel.self, by: statusCode, data)
                completion(networkResult)
            default:
                completion(.networkErr)
            }
        }
    }
}
