//
//  ApplicantsCommentsBox.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class ApplicantsCommentsBox: UIView {

    private let commentLabel = UILabel()
    private let commentCountLabel = UILabel()
    private let stackView = UIStackView()
    private let chevronImageView = UIImageView()
    
    enum CommentType {
        case respect
        case breakTime
        case extraWageWeekend
        
        var comment: String {
            switch self {
            case .respect:
                return "🤝 일하는 사람을 존중해줘요"
            case .breakTime:
                return "⏱️ 휴게시간을 지켜요"
            case .extraWageWeekend:
                return "💰 주휴수당을 잘 챙겨줘요"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ApplicantsCommentsBox {
    
    private func setUI() {
        self.backgroundColor = Color.gray7
        
        commentLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.textColor = Color.gray1
        }
        
        commentCountLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .center
        }
    }
    
    private func setLayout() {
        self.addSubview(stackView)
        stackView.addArrangedSubviews(commentLabel, commentCountLabel)
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension ApplicantsCommentsBox {
    func passComments(of type: CommentType, count: Int = 1) {
        self.commentLabel.text = type.comment
        self.commentCountLabel.text = String(count)
    }
    
    func asMoreButton() {
        self.commentLabel.text = "더보기"
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 12)
        chevronImageView.image = UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration)
        chevronImageView.tintColor = Color.gray2
        chevronImageView.contentMode = .scaleAspectFit
        
        stackView.addArrangedSubview(chevronImageView)
    }
}
