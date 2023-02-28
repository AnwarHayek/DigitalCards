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
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: Sora_SemiBold24]

        //Delete Shadow
        UINavigationBar.appearance().shadowImage = UIImage.init()

        //Edit Navigation Bar Color when sceoll ViewController
        UINavigationBar.appearance().barTintColor = .white

    }
}
