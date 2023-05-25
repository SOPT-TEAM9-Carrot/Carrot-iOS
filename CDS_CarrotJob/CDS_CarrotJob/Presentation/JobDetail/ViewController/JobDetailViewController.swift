//
//  JobDetailViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

import Alamofire
import SnapKit
import Then

protocol JobDetailContstraintChangeDelegate: AnyObject {
    func modifyConstraintTo(heightOf: CGFloat)
}

final class JobDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainDetailView = MainDetailView()
    private let detailProfileView = DetailProfileView()
    private let detailReviewView = DetailReviewListView()
    private let detailLocalListView = DetailLocalListView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setLayout()
    }
}

extension JobDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setDelegate() {
        detailReviewView.delegate = self
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        scrollView.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
        
        mainDetailView.do {
            $0.passTextOfJobDetail(image: UIImage.loadImageOf(carrotImageName: .carrotHeartFill), text: "월,금,토 3일도 가능합니다.\n근무시간 토요일만 17시까지 출근\n초보분도 가능합니다^^\n고기자르는 일 크게 어려운건 없어요~\n잘 못해도 서비스 마인드 가지신 분\n성실하게 일해주실 분이면 환영합니다!\n일하실 분 지원해주세요!")
        }
        
        detailProfileView.do {
            $0.backgroundColor = .clear
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(mainDetailView, detailProfileView, detailReviewView, detailLocalListView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        mainDetailView.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
            $0.height.equalTo(770)
        }
        
        detailProfileView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(mainDetailView.snp.bottom)
            $0.height.equalTo(380)
        }
        
        detailReviewView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(detailProfileView.snp.bottom)
            $0.height.equalTo(735)
        }
        
        detailLocalListView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(detailReviewView.snp.bottom)
            $0.height.equalTo(540)
            $0.bottom.equalToSuperview()
        }
    }
}

extension JobDetailViewController: JobDetailContstraintChangeDelegate {
    func modifyConstraintTo(heightOf: CGFloat) {
        detailReviewView.snp.updateConstraints {
            $0.height.equalTo(heightOf)
        }
    }
}
