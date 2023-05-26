//
//  ProfileService.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/26.
//

import Foundation
import Alamofire

final class ProfileService {
    
    static let shared = ProfileService()
    
    private init() {}
    
    let url = "http://3.34.46.183:8080/users/profile"
    
    func profile(
        name: String,
        phoneNumber: String,
        gender: Int,
        birthYear: Int,
        introduction: String,
        completion: @escaping (NetworkResult<Any>) -> Void) {
            
            let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "2"]
            
            let body: Parameters = [
                "name" : name,
                "phoneNumber" : phoneNumber,
                "gender" : gender,
                "birthYear" : birthYear,
                "introduction" : introduction
            ]
            
            let dataRequest = AF.request(url,
                                         method: .post,
                                         parameters: body,
                                         headers: header)
            
            dataRequest.responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let value = response.value else { return }
                    let networkResult = self.judgeStatus(by: statusCode, value)
                    completion(networkResult)
                case .failure:
                    completion(.networkErr)
                }
            }
        }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<300: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500..<600: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ProfileRegisterResponese.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}

