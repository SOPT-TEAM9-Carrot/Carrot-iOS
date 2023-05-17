//
//  GrayUIButton.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/17.
//

import UIKit

import SnapKit
import Then

final class GrayUIButton: UIButton {
    
    enum CarrotButtonType {
        case lookForOtherJobs
        case bringMoreReviews
        case bringMoreLocalJobs
        case registerCareer
        
        var title: String {
            switch self {
            case .lookForOtherJobs:
                return "다른 알바 더보기"
            case .bringMoreReviews:
                return "후기 더보기"
            case .bringMoreLocalJobs:
                return "우리 동네 알바 더보기"
            case .registerCareer:
                return "경력/경험 등록"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI() {
        self.backgroundColor = Color.gray7
        self.layer.cornerRadius = 6
        self.setTitleColor(Color.gray1, for: .normal)
        self.tintColor = Color.gray1
    }
    
    private func setImageInset(isButtonAtLeft isLeft: Bool) {
        switch isLeft {
        case true:
            self.contentEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 2)
            self.imageEdgeInsets = .init(top: 0, left: -2, bottom: 0, right: 2)
            self.titleEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: -2)
        case false:
            self.contentEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 2)
            self.imageEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: -2)
            self.titleEdgeInsets = .init(top: 0, left: -2, bottom: 0, right: 2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GrayUIButton {
    func setUIOfButtonFor(type: CarrotButtonType) {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 12, weight: .semibold)
        self.setTitle(type.title, for: .normal)
        self.titleLabel?.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)

        switch type {
        case .lookForOtherJobs:
            self.setImage(UIImage(systemName: "arrow.clockwise", withConfiguration: symbolConfiguration), for: .normal)
            self.setImageInset(isButtonAtLeft: true)
        case .bringMoreReviews:
            self.setImage(UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration), for: .normal)
            self.semanticContentAttribute = .forceRightToLeft
            self.setImageInset(isButtonAtLeft: false)
        case .bringMoreLocalJobs:
            self.setImage(UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration), for: .normal)
            self.semanticContentAttribute = .forceRightToLeft
            self.setImageInset(isButtonAtLeft: false)
        default:
            break
        }
    }
}
