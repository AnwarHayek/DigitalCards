//
//  DashboardViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 15/02/2023.
//

import UIKit
import PieCharts
import GravitySliderFlowLayout
import SwiftCharts

class DashboardViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var pageControl: UIPageControl!

    var counter: Int = 0

    var chartView: BarsChart!

    enum Direction: String {
        case left, right
    }

    fileprivate var chart: Chart? // arc

    fileprivate var popups: [UIView] = []

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

    @IBAction func btnLeft(_ sender: Any) {
        self.swappingCollection(direction: .left)

    }

    @IBAction func btnRight(_ sender: Any) {
        self.swappingCollection(direction: .right)
    }

}

extension DashboardViewController {

    func setupView() {
        self.contentView.layer.maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.contentView.cornerRadius = 20
        self.configuerNavigationItems()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView._registerCell = CardCollectionViewCell.self
        let gravitySliderLayout = GravitySliderFlowLayout(with: CGSize(width: collectionView.frame.width * 0.84, height: 200))
        self.collectionView.collectionViewLayout = gravitySliderLayout
    }


    func localized() {

    }

    func setupData() {

    }

    func fetchData() {


    }

}

extension DashboardViewController {

    @objc func pushMenu() {
        let vc = MenuViewController.instantiate(appStoryboard: .Third)
        vc._push()
    }

    @objc func search() {
        debugPrint(#function)
    }

    func configuerNavigationItems() {
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: ic_menu, style: .plain, target: self, action: #selector(pushMenu)),
            self.barButtonItem(title: "Dashboard")
        ]

        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: ic_search, style: .plain, target: self, action: #selector(search))
        ]
    }

    func swappingCollection(direction: Direction) {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        guard let index = visibleIndexPath?.item else { return }

        if direction == .right {
            if index + 1 <= 2 {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.collectionView.contentOffset.x += 189
                }, completion: nil)
            }
            return
        }

        if index > 0 {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.collectionView.contentOffset.x -= 189
            }, completion: nil)
        }
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCollectionViewCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.index = indexPath.item
//        cell.contact = self.object
        cell.configerCell()
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let locationFirst = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x, y: collectionView.center.y + scrollView.contentOffset.y)
        let locationSecond = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x + 20, y: collectionView.center.y + scrollView.contentOffset.y)
        let locationThird = CGPoint(x: collectionView.center.x + scrollView.contentOffset.x - 20, y: collectionView.center.y + scrollView.contentOffset.y)

        if let indexPathFirst = collectionView.indexPathForItem(at: locationFirst), let indexPathSecond = collectionView.indexPathForItem(at: locationSecond), let indexPathThird = collectionView.indexPathForItem(at: locationThird), indexPathFirst.row == indexPathSecond.row && indexPathSecond.row == indexPathThird.row && indexPathFirst.row != pageControl.currentPage {
            pageControl.currentPage = indexPathFirst.row % 3//self.data.count
        }
    }
}

