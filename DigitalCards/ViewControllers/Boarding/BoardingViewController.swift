//
//  BoardingViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 03/02/2023.
//

import UIKit
import JXPageControl

class BoardingViewController: UIViewController {

    @IBOutlet weak var btnStartNow: UIButton!

    @IBOutlet weak var pageControl: JXPageControlExchange!

    @IBOutlet weak var collectionView: UICollectionView!

    var counter: Int = 0

    let objects: [(image: String, title: String, description: String)] = [
        ("ic_Boarding", "Different data in one card", "Now you keep your time and reserve gym machines from anywhere"),
        ("ic_Boarding", "Save Time", "Organize your gym schedules times using reservation app."),
        ("ic_Boarding", "Save Time", "Organize your gym schedules times using reservation app."),
        ("ic_Boarding", "A digital card that's easy to share", "Easily find your gym machines and arrange your course.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func btnStartNow(_ sender: Any) {
        let vc = TabBarController()
        vc._rootPush()
    }

    @IBAction func btnNext(_ sender: Any) {
        if counter <= 2 {
            let indexPath = NSIndexPath(row: counter + 1, section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
    }

    @IBAction func btnSkip(_ sender: Any) {
        let vc = TabBarController()
        vc._rootPush()
    }
}

extension BoardingViewController {

    func setupView() {
        self.collectionView._registerCell = BoardingCell.self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.btnStartNow.isHidden = true
    }
}

extension BoardingViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.bounds.width
        let currentPage = Int(round(progress))

        self.counter = currentPage
        pageControl.progress = progress

        if counter < 3 {
            self.btnStartNow.isHidden = true
            return
        }
        self.btnStartNow.isHidden = false
    }
}

extension BoardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BoardingCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.object = self.objects[indexPath.row]
        cell.configerCell()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}




