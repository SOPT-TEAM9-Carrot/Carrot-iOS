//
//  NSAttributedString+.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/29.
//

import UIKit

extension NSAttributedString {
    static func attributedStringWithSFSymbol(name: String, size: CGFloat, color: UIColor) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: size)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: name, attributes: attributes)
        return attributedString
    }
}
