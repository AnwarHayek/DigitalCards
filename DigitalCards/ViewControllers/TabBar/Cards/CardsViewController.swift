//  Skaik_mo
//
//  CardsViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit
import GravitySliderFlowLayout

class CardsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
        self.fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

// MARK: - ViewDidLoad
extension CardsViewController {

    private func setUpView() {
        self.configureCollectionView()
    }

    private func configureCollectionView() {
        self.collectionView._registerCell = CardCollectionViewCell.self
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.collectionView.layer.maskedCorners = maskedCorners
        self.collectionView.cornerRadius = 20
        self.collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 20, right: 0)

    }

    private func setUpData() {

    }

    private func fetchData() {

    }

}

extension CardsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCollectionViewCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.index = indexPath.item
        cell.configerCell()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width - 30
        let height: CGFloat = 220
        return CGSize.init(width: width, height: height)
    }

}
