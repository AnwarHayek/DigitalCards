// 
//
//  MenuCell.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 06/02/2023.
//

import UIKit

class MenuCell: UITableViewCell {
    
    var object: (image: String, title: String, hint: String)?
    
    var section: Int = 0
    
    @IBOutlet weak var imgMenu: UIImageView!
    
    @IBOutlet weak var lblHint: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    func configerCell() {
        if let object = object {
            self.imgMenu.image = object.image._toImage
            self.lblHint.text = object.hint
            self.lblTitle.text = object.title
        }
        if section == 2 {
            self.lblTitle.textColor = color_FF4848
        }
    }
}

