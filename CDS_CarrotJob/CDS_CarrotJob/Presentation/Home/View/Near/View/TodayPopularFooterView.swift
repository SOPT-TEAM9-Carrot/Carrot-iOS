//
//  TodayPopularFooterView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/23.
//

import UIKit

import SnapKit
import Then

final class TodayPopularFooterView: UICollectionReusableView {
    
    // MARK: - UI Components
    
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

extension TodayPopularFooterView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.white
        
        lineView.do {
            $0.backgroundColor = Color.gray6
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(lineView)
        
        lineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
    }
}
