//
//  ApplyViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class ApplyViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let applyView = ApplyView()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension ApplyViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        scrollView.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.addSubview(applyView
        )
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(scrollView.snp.width)
        }
        applyView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
    
}
