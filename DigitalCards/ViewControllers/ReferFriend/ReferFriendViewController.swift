//
//  ReferFriendViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 08/02/2023.
//

import UIKit

class ReferFriendViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func btnExit(_ sender: Any) {
        self._dismissVC()
    }
}

extension ReferFriendViewController {

    func setupView() {
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.containerView.layer.maskedCorners = maskedCorners
        self.containerView.cornerRadius = 20
    }

    func localized() {

    }

    func setupData() {

    }

    func fetchData() {

    }

}

