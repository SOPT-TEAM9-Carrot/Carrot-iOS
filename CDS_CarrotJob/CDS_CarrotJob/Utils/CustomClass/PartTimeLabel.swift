//
//  PartTimeLabel.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

final class PartTimeLabel: UILabel {
    
    // MARK: - Properties
    
    var partTimeLabeltext: String
    var partTimeLabelTextColor: UIColor
    var partTimeLabelBackgroundColor: UIColor
    private var padding = UIEdgeInsets(top: 3.0, left: 8.0, bottom: 8.0, right: 3.0)
    
    // MARK: - Initializer
    
    init(text: String, textColor: UIColor, backgroundColor: UIColor) {
        self.partTimeLabeltext = text
        self.partTimeLabelTextColor = textColor
        self.partTimeLabelBackgroundColor = backgroundColor
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
    
    func setUI() {
        
        backgroundColor = partTimeLabelBackgroundColor
        text = partTimeLabeltext
        textColor = partTimeLabelTextColor
        font = .notoSansFont(weightOf: .Medium, sizeOf: .font11)
    }
}
