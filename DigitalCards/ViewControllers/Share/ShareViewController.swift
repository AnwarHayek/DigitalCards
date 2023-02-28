//
//  ShareViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 20/02/2023.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var upArrowImage: UIImageView!
    @IBOutlet weak var downArrowImage: UIImageView!
    @IBOutlet weak var myViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scanLabel: UILabel!
    @IBOutlet weak var scanImage: UIImageView!
    @IBOutlet weak var containerStack: UIStackView!
    var isHideScan = false {
        didSet {
            UIView.transition(with: scanImage, duration: isHideScan ? 0.5 : 2) {
                self.scanImage.alpha = self.isHideScan ? 0 : 1
            }
            UIView.transition(with: containerStack, duration: isHideScan ? 2 : 0.5) {
                self.containerStack.alpha = !self.isHideScan ? 0 : 1
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ShareViewController {

    func setupView() {
        self.scanImage.alpha = 0
        self.scanLabel.alpha = 0
        self.scanImage.isHidden = false
        self.isHideScan = true
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }

    @objc private func swipeUp() {
        let shortHeight: CGFloat = (self.view.safeAreaLayoutGuide.layoutFrame.size.height * self.myViewHeight.multiplier) - 60
        self.isHideScan = false
        UIView.animate(withDuration: 0.7) {
            self.myViewHeight.constant = -shortHeight
            self.upArrowImage.alpha = 0
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 3) {
            self.scanLabel.alpha = 1
        }
    }

    @objc private func swipeDown() {
        if self.myViewHeight.constant == 0 {
            self._showAlertOK(title: CODE_TITLE, message: CODE_MESSAGE)
        } else {
            self.isHideScan = true
            UIView.animate(withDuration: 0.7) {
                self.myViewHeight.constant = 0
                self.upArrowImage.alpha = 1
                self.view.layoutIfNeeded()
            }
            UIView.animate(withDuration: 0.1) {
                self.scanLabel.alpha = 0
            }
        }
    }

}

