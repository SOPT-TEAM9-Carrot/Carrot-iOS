//
//  Int+.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/19.
//

import Foundation

extension Int {
    var toPriceFormatString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let resultString = numberFormatter.string(from: NSNumber(value: self)) else { return String() }
        
        return resultString
    }
}
