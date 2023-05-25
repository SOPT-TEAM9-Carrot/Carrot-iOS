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

final class JobDetailNetworkManager {
    static let shared = JobDetailNetworkManager()
    
    private init() {}
    
    func fetchDetailData(postId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/posts" + "/\(postId)"
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
    
    func fetchOtherJobs(postCount: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/posts" + "/list?size=\(postCount)"
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
    
    func fetchReviews(employerID: Int, postCount: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://3.34.46.183:8080" + "/employer" + "/\(employerID)" + "/reviews?size=\(postCount)"
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
    
    private func judgeStatus<T: Codable>(modelType: T.Type, by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print(statusCode)
        switch statusCode {
        case 200: return isValidData(modelType: modelType, data: data)
        case 400, 404: return isValidData(modelType: modelType, data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData<T: Codable>(modelType: T.Type, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(modelType.self, from: data) else {
            return .pathErr}
        
        return .success(decodedData as Any)
    }
}
