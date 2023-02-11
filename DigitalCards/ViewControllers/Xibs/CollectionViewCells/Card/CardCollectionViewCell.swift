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

    var index = 0
    var contact: Contact?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configerCell() {
        if index == 3 {
            self.backgroundImage.image = ic_card4
        } else if index == 2 {
            self.backgroundImage.image = ic_card3
        } else if index == 1 {
            self.backgroundImage.image = ic_card2
        }
        self.connectionsLabel.text = "2"
        self.connectionsTitleLabel.text = CONNECTION_TITLE
        self.userImage.image = demo
        self.userWorkLabel.text = "Youtuber"
        if let contact, let name = contact.name {
            self.userNameLabel.text = name
        } else {
            self.userNameLabel.text = ""
        }
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
//        let vc: SocailMediaViewController = SocailMediaViewController.instantiate(appStoryboard: .Second)
//        vc.modalPresentationStyle = .custom
//        vc.modalTransitionStyle = .crossDissolve
//        vc.contact = self.contact
//        vc._presentVC()
    }

    @IBAction func moreAction(_ sender: Any) {
        debugPrint(#function)
    }

}
