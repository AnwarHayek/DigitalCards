//
//  UISwitchEx.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 11/02/2023.
//

import Foundation
import UIKit

extension UISwitch {

    var offTint: UIColor {
        set {
            let minSide = min(bounds.size.height, bounds.size.width)
            layer.cornerRadius = minSide / 2
            backgroundColor = newValue
            tintColor = newValue
        }
        get {
            return tintColor
        }
    }

    func increaseThumb(scaleX: CGFloat, y: CGFloat) {
        if let thumb = self.subviews[0].subviews[1].subviews[2] as? UIImageView {
            thumb.transform = CGAffineTransform(scaleX: scaleX, y: y)
        }
    }
    func sizeSwitch(scaleX: CGFloat, y: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scaleX, y: y)
    }
}
