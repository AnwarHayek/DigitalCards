//
//  UIResponder.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 10/02/2023.
//

import Foundation
import UIKit

extension UIResponder {
    var _topVC: UIViewController? {
        return AppDelegate.shared?.rootNavigationController?.topViewController
    }
    
}
