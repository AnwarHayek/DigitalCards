//  Skaik_mo
//
//  NotificationsTableViewCell.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 28/02/2023.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    var object: Notification?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configerCell() {
        if let object {
            self.titleLabel.text = object.title
            self.timeLabel.text = object.createdAt
            self.bodyLabel.text = object.body
        } else {
            self.titleLabel.text = ""
            self.timeLabel.text = ""
            self.bodyLabel.text = ""
        }
    }

}
