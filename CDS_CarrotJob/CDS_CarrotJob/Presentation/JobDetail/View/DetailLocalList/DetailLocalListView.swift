//
//  DetailLocalListView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class DetailLocalListView: UIView {
    
    private var jobLists: [PostModel] = []
    private let jobLocationLists: [String] = ["계양 칼국수 • 살라리로2번길 15 •", "부천 재능교육 • 부일로 224-9 •", "쭝식대장 계양 • 계산새로 71 •"]
    
    private let localMainTitleLabel = UILabel()
    private lazy var localJobCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setFlowLayout())
    private let fetchMoreJobButton = GrayUIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setRegister()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailLocalListView {
    
    private func setDelegate() {
        localJobCollectionView.dataSource = self
    }
    
    private func setRegister() {
        localJobCollectionView.registerCell(PartTimeJobCollectionViewCell.self)
    }
    
    private func setUI() {
        localMainTitleLabel.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
            $0.text = "우리동네 알바"
            $0.textColor = Color.gray1
        }
        
        localJobCollectionView.do {
            $0.isScrollEnabled = false
            $0.backgroundColor = .clear
        }
        
        fetchMoreJobButton.do {
            $0.setUIOfButtonFor(type: .bringMoreLocalJobs)
        }
    }
    
    private func setLayout() {
        self.addSubviews(localMainTitleLabel, localJobCollectionView, fetchMoreJobButton)
        
        localMainTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview()
        }
        
        localJobCollectionView.snp.makeConstraints {
            $0.top.equalTo(localMainTitleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(440)
        }
        
        fetchMoreJobButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(32)
            $0.top.equalTo(localJobCollectionView.snp.bottom).offset(15)
        }
    }
    
    private func setFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 144)
        flowLayout.minimumLineSpacing = 2
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }
}

extension DetailLocalListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: PartTimeJobCollectionViewCell.self, indexPath: indexPath)
        if indexPath.item == 2 {
            cell.setUnderLineHidden()
        }
        
        cell.configureCell(imageUrl: jobLists[indexPath.row].image, jobTitle: jobLists[indexPath.row].title, wage: jobLists[indexPath.row].hourlyWage, location: jobLocationLists[indexPath.row])
        
        return cell
    }
}

extension DetailLocalListView {
    func passData(data: [PostModel]) {
        self.jobLists = data
        self.localJobCollectionView.reloadData()
    }
}
