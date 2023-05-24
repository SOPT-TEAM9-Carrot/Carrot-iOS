//
//  HomeNearJobView.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class HomeNearJobView: UIView {
    
    private typealias SectionType = HomeNearJobSection
    
    private enum HomeNearJobSection: CaseIterable {
        case jobLabel, firstPartTime, todayPopular, secondPartTime
    }
    
    // MARK: - UI Components
    
    private lazy var homeNearJobCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    private let jobLabelModel: [JobLabelModel] = JobLabelModel.setJobLabelModel()
    private let partTimeModel: [PartTimeJobModel] = PartTimeJobModel.fetchPartTimeJobdummyData()
    private let partTimeServerModel: [PartTimeServerModel] = PartTimeServerModel.fetchPartTimeJobServerData()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeNearJobView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        
        homeNearJobCollectionView.do {
//            $0.showsVerticalIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = Color.white
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(homeNearJobCollectionView)
        
        homeNearJobCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        homeNearJobCollectionView.delegate = self
        homeNearJobCollectionView.dataSource = self
    }
    
    private func setRegister() {
        homeNearJobCollectionView.registerCell(JobLabelCollectionViewCell.self)
        homeNearJobCollectionView.registerCell(PartTimeJobCollectionViewCell.self)
        homeNearJobCollectionView.registerCell(TodayPopularCollectionViewCell.self)
        homeNearJobCollectionView.registerFooter(JobLabelFooterView.self)
        homeNearJobCollectionView.registerHeader(TodayPopularHeaderView.self)
        homeNearJobCollectionView.registerFooter(TodayPopularFooterView.self)
    }
    
    private func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[section]
            switch sectionType {
            case .jobLabel:
                return self.getLayoutJobLabelSection()
            case .firstPartTime:
                return self.getLayoutFirstPartTimeSection()
            case .todayPopular:
                return self.getLayoutTodayPopularSection()
            case .secondPartTime:
                return self.getLayoutSecondPartTimeSection()
            }
        }
    }
    
    private func getLayoutJobLabelSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func getLayoutFirstPartTimeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func getLayoutTodayPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func getLayoutSecondPartTimeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    // MARK: - @objc Methods
}

extension HomeNearJobView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .jobLabel:
            return jobLabelModel.count
        case .firstPartTime:
            return 3
        case .todayPopular:
            return 4
        case .secondPartTime:
            return partTimeModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .jobLabel:
            let cell = collectionView.dequeueCell(type: JobLabelCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: jobLabelModel[indexPath.row])
            return cell
        case .firstPartTime:
            let cell = collectionView.dequeueCell(type: PartTimeJobCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(serverModel: partTimeServerModel[indexPath.row], dummyModel: partTimeModel[indexPath.row])
            return cell
        case .todayPopular:
            let cell = collectionView.dequeueCell(type: TodayPopularCollectionViewCell.self, indexPath: indexPath)
            return cell
        case .secondPartTime:
            let cell = collectionView.dequeueCell(type: PartTimeJobCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(serverModel: partTimeServerModel[indexPath.row], dummyModel: partTimeModel[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .jobLabel:
            let footerView = collectionView.dequeueReusableCell(kind: kind, type: JobLabelFooterView.self, indexPath: indexPath)
            return footerView
        case .firstPartTime:
            let view = UICollectionReusableView()
            return view
        case .todayPopular:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: TodayPopularHeaderView.self, indexPath: indexPath)
            return headerView
        case .secondPartTime:
            let headerView = collectionView.dequeueReusableCell(kind: kind, type: TodayPopularFooterView.self, indexPath: indexPath)
            return headerView
        }
    }
}

extension HomeNearJobView: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeNearJobSection.allCases.count
    }
}
