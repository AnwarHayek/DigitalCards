//
//  ShareViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 20/02/2023.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var swipeUpView: UIView!
    @IBOutlet weak var superView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .up
        self.myView.addGestureRecognizer(swipeRight)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.myView.addGestureRecognizer(swipeDown)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ShareViewController {

    func setupView() {

    }

    func localized() {

    }

    func setupData() {

    }

    func fetchData() {


    }


    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                
                
                
            case .down:
                let y = self.myView.frame.height - 50
                UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseOut, animations: {
                    self.myView.frame.origin.y += y
                }, completion: nil)

                UIView.animate(withDuration: 1.0) {
                    self.swipeUpView.alpha = 1
                }
                
                
            case .left:
                print("Swiped left")
                
                
            case .up:
                let y = self.myView.frame.height - 50
                UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseOut, animations: {
                    self.myView.frame.origin.y -= y
                }, completion: nil)

                UIView.animate(withDuration: 1.0) {
                    self.swipeUpView.alpha = 0
                }
                
                

            default:
                break
            }
        }
    }
}

