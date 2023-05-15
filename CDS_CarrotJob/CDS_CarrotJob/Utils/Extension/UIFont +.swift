//
//  UIFont +.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/15.
//

import UIKit.UIFont

extension UIFont {
    /// Returns NotoSans Font with its weight and size
    static func notoSansFont(weightOf font: NotoSansFamily, sizeOf size: NotoSansFontSize) -> UIFont? {
        return UIFont(name: "NotoSansKR-\(font.rawValue)", size: size.rawValue)
    }
    
    enum NotoSansFamily: String {
        case Medium, Bold
    }
    
    enum NotoSansFontSize: CGFloat {
        case font10 = 10
        case font11
        case font12
        case font14 = 14
        case font16 = 16
        case font18 = 18
    }
}
