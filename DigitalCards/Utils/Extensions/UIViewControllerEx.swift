//
//  UIViewControllerEx.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 04/02/2023.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: Instantiate ViewController
    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    // MARK: Change RootViewController
    func changeRootViewController(_ vc: UIViewController) {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc)
    }
}
