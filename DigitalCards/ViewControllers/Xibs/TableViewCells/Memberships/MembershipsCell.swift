//
//
//  MembershipsCell.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 11/02/2023.
//

import UIKit

class MembershipsCell: UITableViewCell {

    @IBOutlet weak var myStack: UIStackView!

    var section: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configerCell() {
        if self.section == 4 {
            self.myStack.layer.maskedCorners = self.myStack._roundCorners(isBottomLeft: true, isBottomRight: true)
            self.myStack.cornerRadius = 16
        } else {
            self.myStack.layer.maskedCorners = self.myStack._roundCorners()
            self.myStack.cornerRadius = 0
        }
    }
}
