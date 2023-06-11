//
//  HomeViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let navigationView = HomeNavigationView()
    private let homeScrollView = HomeScrollView()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setLayout()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setDelegate() {
        homeScrollView.homeLocalJobView.delegate = self
    }
    
    private func setUI() {
        
        view.backgroundColor = Color.white
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(navigationView, homeScrollView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(96)
        }
        
        homeScrollView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: HomeLocalJobDataSourceDelegate {
    func passId(postId: Int) {
        let detailServcie = JobDetailGeneralDataManager()
        let localJobsService = JobDetailLocalJobsDataManager()
        let reviewService = JobDetailReviewsDataManager()
        
        let jobDetailVC = JobDetailViewController(detailNetworkServices: detailServcie, localJobsNetworkServices: localJobsService, reviewNetworkServices: reviewService)
        jobDetailVC.passPostId(postId: postId)
        
        self.navigationController?.pushViewController(jobDetailVC, animated: true)
    }
}
