//
//  HomeLoaclJobViewController.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/16.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class HomeLocalJobViewController: BaseViewController {
    
    private let originView = HomeLocalJobView()
    
    //    override func loadView() {
    //        self.view = originView
    //
    //    }
    // MARK: - UI Components
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUI()
        setLayout()
        self.view.addSubview(originView)
        originView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(723)
        }
    }
}

