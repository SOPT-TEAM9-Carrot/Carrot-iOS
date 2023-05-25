//
//  JobLabelModel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/22.
//

import UIKit

struct JobLabelModel {
    let title: String
}

extension JobLabelModel {
    
    static func setJobLabelModel() -> [JobLabelModel] {
        return [
            JobLabelModel(title: "교북동 외 234"),
            JobLabelModel(title: "단기"),
            JobLabelModel(title: "하는일"),
            JobLabelModel(title: "요일")
        ]
    }
    
    private func setJobLabelTitle() {
        
    }
}
