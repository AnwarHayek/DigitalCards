//
//  UIKitHelpers.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 03/02/2023.
//

import Foundation
import UIKit

class rStack: UIStackView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
}

class rImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2.0
    }
}
