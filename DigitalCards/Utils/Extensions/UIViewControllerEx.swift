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

    // MARK: Transfers Shortcuts
    func _rootPush() {
        AppDelegate.shared?.rootNavigationController?.setViewControllers([self], animated: true)
    }

    func _push() {
        AppDelegate.shared?.rootNavigationController?.pushViewController(self, animated: true)
    }

    func _presentVC() {
        AppDelegate.shared?.rootNavigationController?.present(self, animated: true, completion: nil)
    }

    @objc func _pop() {
        AppDelegate.shared?.rootNavigationController?.popViewController(animated: true)
    }

    func _dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func _popViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func _popViewControllerWithoutAnimated(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }

    @IBAction func _dismissViewController(_ sender: Any) {
        self._dismissVC()
    }

    @IBAction func _dismissViewControllerWithoutAnimated(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }


    // MARK: Custom Title BarButton
    func barButtonItem(title: String) -> UIBarButtonItem {
        let titleLabel = UILabel()
        let titleBarButton = UIBarButtonItem()

        titleLabel.frame = CGRect.init(x: 0, y: 0, width: 145, height: 24)
        titleLabel.textColor = color_FFFFFF
        titleLabel.font = Sora_SemiBold18
        titleLabel.text = title
        titleBarButton.customView = titleLabel
        return titleBarButton
    }
}

// MARK: - Alerts Shortcuts
extension UIViewController {
    func _showAlertOK(title: String?, message: String?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction.init(title: "OK", style: .default)
        alert.addAction(okayAction)
        alert._presentVC()
    }
}

