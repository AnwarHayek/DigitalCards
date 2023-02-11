//
//  MembershipsHeader.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 08/02/2023.
//

import UIKit

class MembershipsHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var _view: UIView!

    @IBOutlet weak var mySwitch: UISwitch!

    @IBOutlet weak var lblYearly: UILabel!
    @IBOutlet weak var lblMonthly: UILabel!

    let layout = PagingCollectionViewLayout()

    var yearly: Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupSwitch()
        self.collectionView._registerCell = OfferPriceCell.self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.pageControl.numberOfPages = 4
        self.collectionViewlayout()
    }

    @IBAction func mySwitch(_ sender: Any) {
        self.yearly.toggle()
        if self.yearly {
            self.lblYearly.textColor = "#242333"._color
            self.lblMonthly.textColor = "#888888"._color
            return
        }
        self.lblYearly.textColor = "#888888"._color
        self.lblMonthly.textColor = "#242333"._color
    }
}

extension MembershipsHeader: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = (scrollView.contentOffset.x / scrollView.bounds.width) + 0.9
        self.pageControl.isUserInteractionEnabled = false
        self.pageControl.currentPage = Int(progress)
    }

    func collectionViewlayout() {
        let cellWidth = 250
        let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
        let cellSpacing = (1 / 16) * UIScreen.main.bounds.width

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = cellSpacing
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func setupSwitch() {
        self.mySwitch.sizeSwitch(scaleX: 0.65, y: 0.65)
        self.mySwitch.increaseThumb(scaleX: 0.70, y: 0.70)
        self.mySwitch.onTintColor = "#CCF0E8"._color
        self.mySwitch.offTint = "#CCF0E8"._color
        self.mySwitch.thumbTintColor = "#02B28E"._color
    }
}

extension MembershipsHeader: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OfferPriceCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.configerCell()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sideInset = (collectionView.frame.size.width - 250) / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 250
        let height: CGFloat = collectionView.frame.height - 10
        return CGSize.init(width: width, height: height)
    }
}

