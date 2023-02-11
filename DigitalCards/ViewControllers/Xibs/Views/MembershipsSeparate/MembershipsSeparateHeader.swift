//
//  MembershipsSeparateHeader.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 11/02/2023.
//

import UIKit

class MembershipsSeparateHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var lblTitle: UILabel!

    var section: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configerHeader() {
        if self.section == 1 {
            self.lblTitle.text = "Maximum number of seats"
            return
        }
        self.lblTitle.text = "File storage"
    }
}
