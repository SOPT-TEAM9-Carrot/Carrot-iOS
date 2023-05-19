//
//  KaKaoMapView.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class KaKaoMapView: UIView {

    private var address: String?
    
    private let dummyMapImageView = UIImageView()
    private let addressLabel = UILabel()
    private let copyButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KaKaoMapView {
    private func setUI() {
        dummyMapImageView.do {
            $0.image = UIImage(named: "kakaoMapDummyImage")
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 6
        }
        
        addressLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        
        copyButton.do {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 9)
            $0.setImage(UIImage(systemName: "rectangle.portrait.on.rectangle.portrait", withConfiguration: symbolConfiguration), for: .normal)
            $0.setTitle("복사", for: .normal)
            $0.titleLabel?.textColor = Color.blue1
            $0.titleLabel?.font = .notoSansFont(weightOf: .Medium, sizeOf: .font12)
            $0.tintColor = Color.blue1
            $0.addTarget(self, action: #selector(copyTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.addSubviews(dummyMapImageView, addressLabel, copyButton)
        
        dummyMapImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
            $0.height.equalTo(108)
        }
        
        addressLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(dummyMapImageView.snp.bottom).offset(13)
        }
        
        copyButton.snp.makeConstraints {
            $0.leading.equalTo(addressLabel.snp.trailing).offset(8)
            $0.top.equalTo(addressLabel.snp.top).offset(2)
        }
    }
    
    @objc
    private func copyTapped() {
        print("Address Copied")
    }
}

extension KaKaoMapView {
    func passAddress(address: String) {
        self.address = address
        self.addressLabel.text = address
    }
}
