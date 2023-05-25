//
//  DetailReviewListView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/20.
//

import UIKit

import SnapKit
import Then

protocol JobDetailPagingDelegate: AnyObject {
    func changePage(toNumber: Int)
}

final class DetailReviewListView: UIView {
    
    private var isOnFirstPage = true
    
    weak var delegate: JobDetailContstraintChangeDelegate?
    
    private let segmentView = DetailReviewSegmentView()
    private let reviewPageView = DetailReviewPagingView()
    private let emptyPage = DetailReviewEmptyView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailReviewListView {
    
    private func setDelegate() {
        segmentView.delegate = self
    }
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(segmentView, reviewPageView)
        
        segmentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
        
        reviewPageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(segmentView.snp.bottom).offset(4)
            $0.height.equalTo(600)
        }
    }
}

extension DetailReviewListView: JobDetailPagingDelegate {
    func changePage(toNumber page: Int) {
        switch page {
        case 0:
            if isOnFirstPage == false {
                isOnFirstPage.toggle()
                emptyPage.removeFromSuperview()
                self.addSubview(reviewPageView)
                
                reviewPageView.snp.makeConstraints {
                    $0.horizontalEdges.equalToSuperview()
                    $0.top.equalTo(segmentView.snp.bottom).offset(4)
                    $0.height.equalTo(600)
                }
                
                self.delegate?.modifyConstraintTo(heightOf: 735)
            }
        case 1:
            if isOnFirstPage == true {
                isOnFirstPage.toggle()
                reviewPageView.removeFromSuperview()
                self.addSubview(emptyPage)
                
                emptyPage.snp.makeConstraints {
                    $0.horizontalEdges.equalToSuperview()
                    $0.top.equalTo(segmentView.snp.bottom).offset(4)
                    $0.height.equalTo(250)
                }
                
                self.delegate?.modifyConstraintTo(heightOf: 300)
            }
        default:
            break
        }
    }
}
