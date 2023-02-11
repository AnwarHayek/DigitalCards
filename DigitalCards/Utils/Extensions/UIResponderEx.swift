//
//  UIResponderEx.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 03/02/2023.
//

import Foundation
import UIKit

extension UIResponder {

    static var _id: String {
        return String(describing: self)
    }
    
    var _topVC: UIViewController? {
        return AppDelegate.shared?.rootNavigationController?.topViewController
    }
}
