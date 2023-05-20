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
    
    private let dummyJobData = PartTimeJobModel.partTimeJobdummyData()
    private let dummyServerData = PartTimeServerModel.partTimeJobServerData()
    
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
            $0.top.equalTo(localJobCollectionView.snp.bottom)
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: PartTimeJobCollectionViewCell.self, indexPath: indexPath)
        
        cell.setDataBind(serverModel: dummyServerData[indexPath.item], dummyModel: dummyJobData[indexPath.item])
        
        return cell
    }
}
