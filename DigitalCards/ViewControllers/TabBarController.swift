//
//  TabBarController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 02/02/2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeTabBar()
    }


    func customizeTabBar() {
        //Changing tab bar color
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = "ffffff"._color
        UITabBar.appearance().backgroundColor = "ffffff"._color

        //Changing tab bar item text color
        UITabBar.appearance().tintColor = "green"._color
        UITabBar.appearance().unselectedItemTintColor = "#888888"._color
        
        //Changing tab bar font
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: SORA_REGULAR10], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: SORA_REGULAR10], for: .selected)
    }
}
