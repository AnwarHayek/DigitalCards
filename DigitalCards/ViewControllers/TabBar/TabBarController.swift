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
        self.setUpViews()
    }


    func customizeTabBar() {
//        //Changing tab bar color
        UITabBar.appearance().barTintColor = color_FFFFFF
        UITabBar.appearance().backgroundColor = color_FFFFFF
        UITabBar.appearance().shadowColor = color_000000
        UITabBar.appearance().shadowOffset = CGSize(width: 0, height: 0)
        UITabBar.appearance().shadowRadius = 20
        UITabBar.appearance().shadowOpacity = 0.2

        //Changing tab bar item text color
        UITabBar.appearance().tintColor = color_green
        UITabBar.appearance().unselectedItemTintColor = color_888888

        //Changing tab bar font
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: SORA_REGULAR10], for: .normal)

        self.tabBar.cornerRadius = 15
        self.tabBar.layer.maskedCorners = self.tabBar._roundCorners(isTopLeft: true, isTopRight: true)

    }

    private func setUpViews() {
        let vc1: DataViewController = DataViewController.instantiate(appStoryboard: .Third)
        vc1.tabBarItem = UITabBarItem(title: DATA_TITLE, image: ic_unSelectedData, selectedImage: ic_selectedData)
        let vc2: CardsViewController = CardsViewController.instantiate(appStoryboard: .Second)
        vc2.tabBarItem = UITabBarItem(title: CARDS_TITLE, image: ic_unSelectedCards, selectedImage: ic_selectedCards)
        let vc3: ContactsViewController = ContactsViewController.instantiate(appStoryboard: .Second)
        vc3.tabBarItem = UITabBarItem(title: CONTACTS_TITLE, image: ic_unSelectedContacts, selectedImage: ic_selectedContacts)
        let vc4: FindPeopleViewController = FindPeopleViewController.instantiate(appStoryboard: .Second)
        vc4.tabBarItem = UITabBarItem(title: FIND_PEOPLE_TITLE, image: ic_unSelectedFindPeople, selectedImage: ic_SelectedFindPeople)
        let vc5: NotificationsViewController = NotificationsViewController.instantiate(appStoryboard: .Second)
        vc5.tabBarItem = UITabBarItem(title: NOTIFI_TITLE, image: ic_unSelectedNotifications, selectedImage: ic_selectedNotifications)
        self.viewControllers = [
            vc1, vc2, vc3, vc4, vc5
        ]
    }
}
