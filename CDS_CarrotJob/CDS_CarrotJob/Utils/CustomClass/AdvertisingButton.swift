//
//  AdvertisingButton.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

final class AdvertisingButton: UIButton {
    
    // MARK: - Property
    
    var buttonName: AttributedString
    var buttonImage: UIImage
    
    // MARK: - Initializer
    
    init(buttonName: AttributedString, buttonImage: UIImage) {
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
        
        buttonName.font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
        
        var config = UIButton.Configuration.filled()
        config.attributedTitle = buttonName
        config.titleAlignment = .center
        config.image = buttonImage
        config.imagePadding = 9
        config.baseBackgroundColor = .clear
        config.imagePlacement = NSDirectionalRectEdge.trailing
        configuration = config
    }
}

