//
//  UIImage+.swift
//  CDS_CarrotJob
//
//  Created by KYUBO A. SHIM on 2023/05/15.
//

import UIKit.UIImage

extension UIImage {
    /// Only fetches Images of Carrot Assests
    static func loadImageOf(carrotImageName image: CarrotImages) -> UIImage {
        guard let imageToFetch = UIImage(named: image.rawValue) else {
            print("Image Named \"\(image.rawValue)\" is not loaded. Pleas check the name.")
            return UIImage()
        }
        
        return imageToFetch
    }
}

enum CarrotImages: String {
    case carrotBell
    case carrotCalendar
    case carrotCalendarCheck
    case carrotCalendarFill
    case carrotChervonRight
    case carrotClock
    case carrotCoin
    case carrotDeclaration
    case carrotHeart
    case carrotHeartFill
    case carrotInformationCircle
    case carrotNavigationBack
    case carrotPencil
    case carrotPersonProfile
    case carrotRoleBox
    case carrotShare
    case carrotStar
    case carrotTalkBubble
    case carrotXMark
}
