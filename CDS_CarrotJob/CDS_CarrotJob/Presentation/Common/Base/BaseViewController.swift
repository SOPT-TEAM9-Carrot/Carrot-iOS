//
//  BaseViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    let width = UIScreen.main.bounds.width
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension BaseViewController {
    
    // MARK: - UI Components Property
    
    func setUI() {
        
        view.backgroundColor = Color.white
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {}
}
