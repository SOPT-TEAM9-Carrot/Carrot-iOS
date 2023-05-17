//
//  HomeNavigationView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationView: UIView {
    
    // MARK: - UI Components
    
    private let dismissButton = UIButton()
    private let carrotJobLabel = UILabel()
    private let profileButton = UIButton()
    private let writingButton = UIButton()
    private let searchBar = UITextField()
//    private let searchBar = UISearchBar()
    private let lineView = UIView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeNavigationView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        dismissButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotXMark), for: .normal)
        }
        
        carrotJobLabel.do {
            $0.text = "당근알바"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        profileButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotPersonProfile), for: .normal)
        }
        
        writingButton.do {
            $0.setImage(UIImage.loadImageOf(carrotImageName: .carrotPencil), for: .normal)
        }
        
        searchBar.do {
            $0.backgroundColor = Color.gray7
               $0.placeholder = "'어린이날 알바' 찾아보기"
               $0.setPlaceholderColor(placeholderColor: Color.gray5)
               $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
               $0.layer.cornerRadius = 6
               $0.setLeftPaddingPoints(10)
        }
        
//        searchBar.do {
//            let placeholder = "'어린이날 알바' 찾아보기"
//            let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
//                NSAttributedString.Key.font: UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font14)!, // 원하는 폰트 설정
//                NSAttributedString.Key.foregroundColor: Color.gray5 // 원하는 색상 설정
//            ])
//            if let textField = searchBar.value(forKey: "searchField") as? UITextField {
//                textField.attributedPlaceholder = attributedPlaceholder
//            }
//            $0.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//            $0.layer.cornerRadius = 6
//        }
        
        lineView.do {
            $0.backgroundColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(dismissButton, carrotJobLabel, profileButton,
                    writingButton, searchBar, lineView)
        
        dismissButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        carrotJobLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(30)
        }
        
        writingButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints {
            $0.trailing.equalTo(writingButton.snp.leading)
            $0.top.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(dismissButton.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(36)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
