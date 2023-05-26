//
//  ProfileRegister.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/26.
//

import Foundation

// MARK: - Welcome
struct ProfileRegister: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: ProfileDataClass
}

// MARK: - DataClass
struct ProfileDataClass: Codable {
    let name, phoneNumber: String
    let gender, birthYear: Int
    let introduction: String
}
