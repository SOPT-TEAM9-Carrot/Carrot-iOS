//
//  JobDetailToastView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class JobDetailToastView: UIView {

    private let toastLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Color.gray2
        
        toastLabel.do {
            $0.text = "주소가 복사되었습니다."
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
            $0.textColor = .white
        }
        
        self.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
