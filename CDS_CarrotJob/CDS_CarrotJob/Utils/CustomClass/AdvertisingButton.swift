//
//  AdvertisingButton.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

class AdvertisingButton: UIButton {
    private let spacing: CGFloat
    
    init(title: String, image: UIImage, spacing: CGFloat) {
        self.spacing = spacing
        super.init(frame: .zero)
        if let resizedImage = image.resized(toWidth: 20.0, height: 25.0) {
            setButton(title: title, image: resizedImage, spacing: spacing)
        } else {
            // 이미지 조정 실패에 대한 처리
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton(title: String, image: UIImage, spacing: CGFloat) {
        // Create the attributed title with desired attributes
        let attributedTitle = NSAttributedString(string: title, attributes: [
            .font: UIFont.notoSansFont(weightOf: .Medium, sizeOf: .font11)!,
            .foregroundColor: Color.gray3
        ])
        
        // Set the button's attributed title
        setAttributedTitle(attributedTitle, for: .normal)
        
        setImage(image, for: .normal)
//        setImage(UIImage(systemName: "bubble.left"), for: .normal)
        tintColor = .secondaryLabel
//        setTitle("5", for: .normal)
        setTitleColor(.secondaryLabel, for: .normal)
        semanticContentAttribute = .forceRightToLeft
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .trailing
        
        // Adjust the image and content insets
            let imageInset = spacing / 2.0
            let contentInset = -spacing / 2.0
            imageEdgeInsets = UIEdgeInsets(top: 0, left: contentInset, bottom: 0, right: -contentInset)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageInset, bottom: 0, right: imageInset)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: imageInset, bottom: 0, right: contentInset)
    }
}
