//
//  HomeLocalJobView.swift
//  CDS_CarrotJob
//
//  Created by 김동현 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class HomeLocalJobView: UIView {

    var dataArray: [Job] = Job.dummy()
    
    let title1Label = UILabel().then {
        $0.textColor = .black
        $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
        $0.text = "내 주변 사장님이"
        $0.numberOfLines = 0
    }
    let title2Label = UILabel().then {
        $0.textColor = .black
        $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font16)
        $0.text = "상도동 떡잎방법대님을 찾고 있어요!"
        $0.numberOfLines = 0
    }
    
    private lazy var homeLocalJobCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("HomeLocalJobView Error!")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        homeLocalJobCollectionView.dataSource = self
        
        homeLocalJobCollectionView.do {
            $0.isScrollEnabled = false
            $0.register(HomeLocalJobCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionView1")
        }
    }
    
    private func setLayout() {
        self.addSubviews(title1Label, title2Label)
        self.addSubview(homeLocalJobCollectionView)
        title1Label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(157)
            $0.leading.equalToSuperview().inset(17)
        }
        title2Label.snp.makeConstraints {
            $0.top.equalTo(title1Label.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(17)
        }
        
        // MARK: - CollectionView Cell 위치 잡는 부분
        homeLocalJobCollectionView.snp.makeConstraints {
            $0.top.equalTo(title2Label.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
   
    private func flowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 176, height: 220)
        // 사실 이 부분.. 뷰 기준으로 나누고 해야하는 거 같은데 일단은 임의로 width값 바꿔서 넣었어요..
        flowLayout.minimumInteritemSpacing = 8
        return flowLayout
    }
}

extension HomeLocalJobView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView1", for: indexPath) as? HomeLocalJobCollectionViewCell else {
            print("NOT WORKING!!NOT WORKING!!NOT WORKING!!NOT WORKING!!")
            return UICollectionViewCell() }
    
        cell.configureCell(model: dataArray[indexPath.row])
        return cell
    }
}
