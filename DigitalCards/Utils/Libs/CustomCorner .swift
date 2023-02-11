//
//  CustomCorner .swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 10/02/2023.
//

import Foundation
import UIKit

class CustomBorder: UIView {

    @IBInspectable var color: UIColor = .clear

    @IBInspectable var thickness: CGFloat =  0

    @IBInspectable var top: Bool = false
    @IBInspectable var bottom: Bool = false
    @IBInspectable var left: Bool = false
    @IBInspectable var right: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()

        if top {
            addBorder(toEdge: .top)
        }
        if bottom {
            addBorder(toEdge: .bottom)
        }
        if left {
            addBorder(toEdge: .left)
        }
        if right {
            addBorder(toEdge: .right)
        }
    }

    // MARK: Add a border just on side of a UIView
    func addBorder(toEdge edges: UIRectEdge) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch edges {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        layer.addSublayer(border)
    }
}
