//
//  GlobalConstants.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 03/02/2023.
//

import Foundation
import UIKit

// MARK: - Fonts
let SORA_REGULAR10 = UIFont.init(name: "Sora-Regular", size: 10) ?? SYSTEM_FONT_REGULAR20
let Sora_SemiBold24 = UIFont.init(name: "Sora-SemiBold", size: 24)
let Sora_SemiBold18 = UIFont.init(name: "Sora-SemiBold", size: 20)
let SYSTEM_FONT_REGULAR20 = UIFont.systemFont(ofSize: 10, weight: .regular)

// MARK: - Colors
let color_FFFFFF = "FFFFFF"._color
let color_000000 = "000000"._color
let color_green = "green"._color
let color_888888 = "888888"._color
let color_E3E8EF = "E3E8EF"._color

// MARK: - Enum
enum AppStoryboard: String {
    case Main
    case Second
    case Third
}

// MARK: -  Images
let ic_selectedCards = "ic_selectedCards"._toImage
let ic_selectedContacts = "ic_selectedContacts"._toImage
let ic_selectedData = "ic_selectedData"._toImage
let ic_SelectedFindPeople = "ic_SelectedFindPeople"._toImage
let ic_selectedNotifications = "ic_selectedNotifications"._toImage
let ic_unSelectedCards = "ic_unSelectedCards"._toImage
let ic_unSelectedContacts = "ic_unSelectedContacts"._toImage
let ic_unSelectedData = "ic_unSelectedData"._toImage
let ic_unSelectedFindPeople = "ic_unSelectedFindPeople"._toImage
let ic_unSelectedNotifications = "ic_unSelectedNotifications"._toImage
let ic_card1 = "ic_card1"._toImage
let ic_setting = "ic_setting"._toImage
let ic_share = "ic_share"._toImage
let ic_menu = "ic_menu"._toImage


// MARK: - Demo
let demo = "demo"._toImage

