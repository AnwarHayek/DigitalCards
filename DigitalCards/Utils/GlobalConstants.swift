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

let SYSTEM_FONT_REGULAR20 = UIFont.systemFont(ofSize: 10, weight: .regular)

// MARK: - Enum
enum AppStoryboard: String {
    case Main = "Main"
    case Contacts = "Contacts"
}
