//  Skaik_mo
//
//  SocailMediaViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 11/02/2023.
//

import UIKit

class SocailMediaViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var socialLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
    }

    @IBAction func instaShareAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func twitterShareAction(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func facebookShareAction(_ sender: Any) {
        debugPrint(#function)
    }
    
}

// MARK: - ViewDidLoad
extension SocailMediaViewController {

    private func setUpView() {
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.containerView.layer.maskedCorners = maskedCorners
        self.containerView.cornerRadius = 20
    }
    
    private func setUpData() {
        self.socialLabel.text = SOCAIL_TITLE
        if let contact, let name = contact.name {
            self.contactLabel.text = name
        } else {
            self.contactLabel.text = ""
        }
    }

}
