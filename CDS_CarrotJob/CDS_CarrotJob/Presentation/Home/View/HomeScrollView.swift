//
//  HomeScrollView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/25.
//

import UIKit

final class HomeScrollView: UIScrollView {
    
    // MARK: - UI Components

    private let homeLocalJobView = HomeLocalJobView()
    private let firstSectionLine = UIView()
    private let homeNearJobView = HomeNearJobView()
    
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

extension HomeScrollView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        
        firstSectionLine.do {
            $0.backgroundColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(homeLocalJobView, firstSectionLine, homeNearJobView)
        
        homeLocalJobView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(600)
        }
        
        firstSectionLine.snp.makeConstraints {
            $0.top.equalTo(homeLocalJobView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(6)
        }
        
        homeNearJobView.snp.makeConstraints {
            $0.top.equalTo(firstSectionLine.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(1704)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
}
