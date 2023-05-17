//
//  OrangeUIButton.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/17.
//

import UIKit

import SnapKit
import Then

class OrangeUIButton: UIButton {

    enum CarrotButtonType {
        case inquireOnThePhone
        case apply
        case cancel
        case leave
        case confirm
        
        var title: String {
            switch self {
            case .inquireOnThePhone:
                return "전화문의"
            case .apply:
                return "지원하기"
            case .cancel:
                return "취소"
            case .leave:
                return "나가기"
            case .confirm:
                return "확인"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI() {
        self.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrangeUIButton {
    /// type 만 입력하면, 색상과 폰트를 맞춰 그립니다. 크기와 addTarget 만 설정하면 됩니다.
    func setUIOfButtonFor(type: CarrotButtonType) {
        self.setTitle(type.title, for: .normal)
        self.titleLabel?.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
        
        switch type {
        case .inquireOnThePhone:
            self.setTitleColor(Color.mainColor1, for: .normal)
            self.backgroundColor = Color.mainColor2
        case .apply:
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = Color.mainColor1
        case .cancel:
            self.setTitleColor(Color.gray4, for: .normal)
            self.backgroundColor = Color.gray7
        case .leave, .confirm:
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = Color.mainColor1
        }
    }
}
