//  Skaik_mo
//
//  CardCollectionViewCell.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var connectionsLabel: UILabel!
    @IBOutlet weak var connectionsTitleLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userWorkLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configerCell() {
        self.backgroundImage.image = ic_card1
        self.connectionsLabel.text = "2"
        self.connectionsTitleLabel.text = "Connections"
        self.userImage.image = demo
        self.userNameLabel.text = "User Name"
        self.userWorkLabel.text = "Youtuber"
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func callAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func smsAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func messageAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func locationAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func globalAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func shareAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func moreAction(_ sender: Any) {
        debugPrint(#function)
    }
    
}
