//
//  job.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/16.
//

import UIKit

struct JobLocalModel {
    let jobImage: UIImage
    let mainInfo: String
    let subInfo: String
    let moneyInfo: String
}

extension JobLocalModel {
    static func dummy() -> [JobLocalModel] {
        return [
            JobLocalModel(jobImage: UIImage(named: "good")!,
                mainInfo: "숭실대입구역 맥도날드 상하이 버거 오후6시~오후9시",
                subInfo: "맥도날드 숭실대 · 상도로 4가 ",
                moneyInfo: "월급 500만원"),
            JobLocalModel(jobImage: UIImage(named: "good")!,
                mainInfo: "숭실대입구역 버거킹 와퍼 오후3시~오후7시 ",
                subInfo: "버거킹 숭실대 · 상도로 3가 ",
                moneyInfo: "월급 400만원"),
            JobLocalModel(jobImage: UIImage(named: "good")!,
                mainInfo: "숭실대입구역 맘스터치 싸이버거 오후2시~오후4시",
                subInfo: "맘스터치 숭실대 · 상도로 2가 ",
                moneyInfo: "월급 300만원"),
            JobLocalModel(jobImage: UIImage(named: "good")!,
                mainInfo: "숭실대입구역 롯데리아 소프트콘 오후3시~오후10시",
                subInfo: "롯데리아 숭실대 · 상도로 1가 ",
                moneyInfo: "월급 200만원")]
    }
}
