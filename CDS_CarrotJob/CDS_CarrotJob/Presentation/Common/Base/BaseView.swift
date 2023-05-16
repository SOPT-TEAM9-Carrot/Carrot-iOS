//
//  BaseView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Properties
    
    let width = UIScreen.main.bounds.width
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseView {
    
    // MARK: - UI Components Property
    
    func setUI() {
        
        backgroundColor = Color.white
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {}
}
