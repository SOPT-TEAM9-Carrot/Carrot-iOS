//
//  UITextField+.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/15.
//

import UIKit

extension UITextField {
    
    func setPlaceholderSetting(placeholderColor: UIColor, placeholderFont: UIFont) {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [
                    .foregroundColor: placeholderColor,
                    .font: placeholderFont
                ].compactMapValues { $0 }
            )
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat) { // 왼쪽에 여백 주기
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
    }
     
    func setRightPaddingPoints(_ amount: CGFloat) { // 오른쪽에 여백 주기
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
    }
}
