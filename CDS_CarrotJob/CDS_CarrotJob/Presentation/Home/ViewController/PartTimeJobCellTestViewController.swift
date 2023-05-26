//
//  PartTimeJobCellTestViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class PartTimeJobCellTestViewController: UIViewController {
    
    //    // MARK: - UI Components
    //
    //    private let collectionView: UICollectionView = {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.scrollDirection = .vertical
    //        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    //        return collectionView
    //    }()
    //    private let dummyModel = PartTimeJobModel.fetchPartTimeJobdummyData()
    //    private let serverModel = PartTimeServerModel.fetchPartTimeJobServerData()
    //    private let homeNearJobView = HomeNearJobView()
    //
    //    // MARK: - Properties
    //
    //    // MARK: - Initializer
    //
    //    // MARK: - View Life Cycle
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        setUI()
    //        setLayout()
    //        view.backgroundColor = .white
    //    }
    //}
    //
    //extension PartTimeJobCellTestViewController {
    //
    //    // MARK: - UI Components Property
    //
    //    private func setUI() {
    //
    //        collectionView.do {
    //            $0.translatesAutoresizingMaskIntoConstraints = false
    //            $0.showsHorizontalScrollIndicator = true
    //            $0.backgroundColor = .clear
    //            $0.isScrollEnabled = true
    //            $0.registerCell(PartTimeJobCollectionViewCell.self)
    //            $0.delegate = self
    //            $0.dataSource = self
    //        }
    //
    //    }
    //
    //    // MARK: - Layout Helper
    //
    //    private func setLayout() {
    //
    //        view.addSubviews(collectionView, homeNearJobView)
    //
    //        homeNearJobView.snp.makeConstraints {
    //            $0.edges.equalTo(view.safeAreaLayoutGuide)
    //        }
    //    }
    //
    //    // MARK: - Methods
    //
    //    // MARK: - @objc Methods
    //}
    //
    //// MARK: - UICollectionViewDataSource
    //
    //extension PartTimeJobCellTestViewController: UICollectionViewDataSource {
    //
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return dummyModel.count
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueCell(type: PartTimeJobCollectionViewCell.self, indexPath: indexPath)
    //        cell.setDataBind(serverModel: serverModel[indexPath.row], dummyModel: dummyModel[indexPath.row])
    //        return cell
    //    }
    //}
    //
    //// MARK: - UICollectionViewDelegateFlowLayout
    //
    //extension PartTimeJobCellTestViewController: UICollectionViewDelegateFlowLayout {
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let width = UIScreen.main.bounds.width
    //        let height = 140.0
    //        return CGSize(width: width, height: height)
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    //}
}
