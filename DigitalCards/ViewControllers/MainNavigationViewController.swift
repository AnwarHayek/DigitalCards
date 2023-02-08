//  Skaik_mo
//
//  MainNavigationViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit

class MainNavigationController: UINavigationController {

    let appearance = UINavigationBarAppearance()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
}

// MARK: - ViewDidLoad
extension MainNavigationController {

    private func setupViewDidLoad() {
        AppDelegate.shared?.rootNavigationController = self
        setRoot()
        setUpNavigation()
//        self.color = color_FFFFFF
    }
}

extension MainNavigationController {

    private func setRoot() {
        let vc: BoardingViewController = BoardingViewController.instantiate(appStoryboard: .Main)
        vc._rootPush()
    }
    
    func setUpNavigation() {
        
        //Empty Back Button Title
        UINavigationBar.appearance().topItem?.backButtonTitle = ""

        //Change Back Button Color
        UIBarButtonItem.appearance().tintColor = .white

        //Edit Font Small Title
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Sora_SemiBold24]

        //Delete Shadow
        UINavigationBar.appearance().shadowImage = UIImage.init()

        //Edit Navigation Bar Color when sceoll ViewController
        UINavigationBar.appearance().barTintColor = .white

    }
}

extension UINavigationController {

    var backgroundColorWhenScroll: UIColor {
        set {
            self.navigationBar.barTintColor = newValue
        }
        get {
            return .clear
        }
    }

    var color: UIColor {
        set {
            self.setProperties(color: newValue)
        }
        get {
            return .clear
        }
    }

    private func setProperties(color: UIColor) {

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: Sora_SemiBold24]

        if #available(iOS 13, *) {

            let standardAppearance = UINavigationBarAppearance()

//            standardAppearance.configureWithOpaqueBackground()
            standardAppearance.configureWithTransparentBackground()
            // title
            standardAppearance.titleTextAttributes = titleTextAttributes

            self.navigationBar.standardAppearance = standardAppearance
            self.navigationBar.scrollEdgeAppearance = standardAppearance
        } else {

            self.navigationBar.titleTextAttributes = titleTextAttributes
        }

        self.navigationBar.topItem?.backButtonTitle = ""
        self.navigationBar.tintColor = color
    }
}
