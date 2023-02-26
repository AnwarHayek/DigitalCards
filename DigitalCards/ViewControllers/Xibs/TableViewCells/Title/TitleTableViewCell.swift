//  Skaik_mo
//
//  TitleTableViewCell.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 26/02/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var object: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    func configerCell() {
        if let object {
            self.titleLabel.text = object
        }
    }

}
