//
//  MainDetailView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class MainDetailView: UIView {
    
    // MARK: - Properties
    
    private var appliedCount: Int = 1
    private var likedCount: Int = 3
    private var clickCount: Int = 27
    private var categoryList: [String] = []
    
    // MARK: - UI Components
    
    private let mainImageView = UIImageView()
    private lazy var jobCategoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setFlowLayout())
    private let titleStackView = JobTitleStackView()
    private let dividerView = UIView()
    private let infoStackView = JobInformationStackView()
    let describingTextView = UITextView()
    private let localInfoView = JobLocalInformingView()
    private lazy var statisticsView = JobStatisticsView(applicantsCount: appliedCount, likeCount: likedCount, clickedCount: clickCount)
    
    // MARK: - Initializer
    
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

extension MainDetailView {
    
    // MARK: - UI Components Property
    
    private func setDelegate() {
        jobCategoryCollectionView.dataSource = self
        jobCategoryCollectionView.delegate = self
    }

    private func setUI() {
        jobCategoryCollectionView.do {
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = false
            $0.isScrollEnabled = false
            $0.registerCell(CategoryCollectionViewCell.self)
        }
        
        mainImageView.do {
            $0.layer.masksToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .gray
        }
        
        titleStackView.do {
            $0.configureView(part: "서빙", title: "", placeTime: "솝트 서울역점 · 12시간 전")
        }
        
        dividerView.do {
            $0.backgroundColor = Color.gray7
        }
        
        describingTextView.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.isEditable = false
            $0.textContainerInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            $0.isScrollEnabled = false
            $0.sizeToFit()
            $0.backgroundColor = .clear
            $0.textColor = Color.gray1
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.sizeToFit()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        self.addSubviews(mainImageView, jobCategoryCollectionView, titleStackView, dividerView, infoStackView, describingTextView, localInfoView, statisticsView)
     
        mainImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        jobCategoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(30)
        }
        
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(jobCategoryCollectionView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(80)
        }
        
        describingTextView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(infoStackView.snp.bottom).offset(20)
        }
        
        localInfoView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(describingTextView.snp.bottom).offset(40)
            $0.height.equalTo(60)
        }
        
        statisticsView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(localInfoView.snp.bottom)
                .offset(17)
        }
    }
}

extension MainDetailView {
    
    // MARK: - Methods
    
    private func setFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }
    
    func passTextOfJobDetail(imageUrl: String, titleText: String, contentText: String, wage: Int) {
        guard let url = URL(string: imageUrl) else { return }
        self.describingTextView.text = contentText
        self.mainImageView.load(url: url)
        self.titleStackView.jobTitleLabel.text = titleText
        self.infoStackView.hourlyWageLabel.configureTexts(textColor: Color.mainColor1, textWeight: .Bold, text: "시급 \(wage.toPriceFormatString) 원")
    }
}

extension MainDetailView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: CategoryCollectionViewCell.self, indexPath: indexPath)
        
        cell.configureCell(category: categoryList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = NSString(string: categoryList[indexPath.item])
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font: UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font10) ?? .boldSystemFont(ofSize: 10)])
        
        return CGSize(width: itemSize.width + 10, height: 20)
    }
}

extension MainDetailView {
    func passData(categories: [String]) {
        self.categoryList = categories
        self.jobCategoryCollectionView.reloadData()
    }
}
