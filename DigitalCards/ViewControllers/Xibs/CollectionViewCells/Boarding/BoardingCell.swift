//
//
//  BoardingCell.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 03/02/2023.
//

import UIKit

class BoardingCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var imgBoarding: UIImageView!

    
    var object: (image: String, title: String, description: String)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configerCell() {
        if let _object = object {
            self.lblTitle.text = _object.title
            self.lblDescription.text = _object.description
            self.imgBoarding.image = _object.image._toImage
        }
    }
}
