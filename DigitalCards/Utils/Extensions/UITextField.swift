//
//  UITextField.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 11/02/2023.
//

import Foundation
import UIKit

extension UITextField {

    var _getText: String {
        var value = ""
        if let _text = self.text {
            value = _text._removeWhiteSpace
        }
        return value
    }

}
