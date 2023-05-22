//
//  DetailReviewEmptyView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class DetailReviewEmptyView: UIView {

    private let emptyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        emptyLabel.do {
            $0.text = "아직 추가 알바가 없어요."
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray4
        }
        
        self.addSubview(emptyLabel)
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
