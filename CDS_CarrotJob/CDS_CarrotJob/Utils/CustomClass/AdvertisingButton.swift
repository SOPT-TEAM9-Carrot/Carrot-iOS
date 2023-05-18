//
//  AdvertisingButton.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

final class AdvertisingButton: UIButton {
    
    // MARK: - Property
    
    var buttonName: String
    var buttonImage: UIImage
    
    // MARK: - Initializer
    
    init(buttonName: String, buttonImage: UIImage) {
        self.buttonName = buttonName
        self.buttonImage = buttonImage
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    func setUI() {
        
        backgroundColor = .clear
        setTitle(buttonName, for: .normal)
        setTitleColor(Color.gray3, for: .normal)
        tintColor = Color.gray3
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 9, weight: .light)
        setImage(UIImage(systemName: "info.circle", withConfiguration: symbolConfiguration), for: .normal)
        titleLabel?.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
        semanticContentAttribute = .forceRightToLeft
        contentHorizontalAlignment = .trailing
        imageEdgeInsets = .init(top: 1, left: 3, bottom: 0, right: 0)
    }
}
