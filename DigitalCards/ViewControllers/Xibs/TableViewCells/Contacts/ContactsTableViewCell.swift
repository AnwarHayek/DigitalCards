//  Skaik_mo
//
//  ContactsTableViewCell.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 06/02/2023.
//

import UIKit
import GravitySliderFlowLayout

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundStack: UIStackView!
    @IBOutlet weak var contactsImage: rImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var buttomStack: UIStackView!

    var object: Contact?
    private var data: [Int] = [1, 2, 3]
    private var isHiddenCard = true {
        didSet {
            self.buttomStack.isHidden = self.isHiddenCard
            self.editButton.isHidden = self.isHiddenCard
            self.tagButton.isHidden = self.isHiddenCard
            self.starButton.isHidden = self.isHiddenCard
            self.backgroundStack.backgroundColor = self.isHiddenCard ? .clear : color_F5F8FA
            self.backgroundStack.layoutMargins = self.isHiddenCard ? .zero : UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.isHiddenCard = true
    }

    func configerCell() {
        self.pageControl.numberOfPages = data.count
        if let object {
            if !object.isHiddenCard {
                self.setCollectionView()
            }
            self.contactsImage.image = object.image
            self.nameLabel.text = object.name
            self.isHiddenCard = object.isHiddenCard
        } else {
            self.contactsImage.image = nil
            self.nameLabel.text = ""
        }
    }

    private func setCollectionView() {
        self.collectionView._registerCell = CardCollectionViewCell.self
        let gravitySliderLayout = GravitySliderFlowLayout(with: CGSize(width: collectionView.frame.width * 0.8, height: 200))
        self.collectionView.collectionViewLayout = gravitySliderLayout
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

    }

    @IBAction func editAction(_ sender: Any) {
        debugPrint(#function)
    }

    @IBAction func tagAction(_ sender: Any) {
        debugPrint(#function)
    }

    @IBAction func starAction(_ sender: Any) {
        debugPrint(#function)
    }

}

extension ContactsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        debugPrint(#function)
        let cell: CardCollectionViewCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.index = indexPath.item
        cell.configerCell()
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let locationFirst = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x, y: collectionView.center.y + scrollView.contentOffset.y)
        let locationSecond = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x + 20, y: collectionView.center.y + scrollView.contentOffset.y)
        let locationThird = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x - 20, y: collectionView.center.y + scrollView.contentOffset.y)

        if let indexPathFirst = collectionView.indexPathForItem(at: locationFirst), let indexPathSecond = collectionView.indexPathForItem(at: locationSecond), let indexPathThird = collectionView.indexPathForItem(at: locationThird), indexPathFirst.row == indexPathSecond.row && indexPathSecond.row == indexPathThird.row && indexPathFirst.row != pageControl.currentPage {
            pageControl.currentPage = indexPathFirst.row % self.data.count
        }
    }
}
