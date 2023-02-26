//  Skaik_mo
//
//  FiltersViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 26/02/2023.
//

import UIKit

class FiltersViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var containerStack: UIStackView!
    @IBOutlet weak var typesContactsLabel: UILabel!
    @IBOutlet weak var typesCollection: UICollectionView!
    @IBOutlet weak var cardsLabel: UILabel!
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var counrtyLabel: UILabel!
    @IBOutlet weak var counrtyContainer: UIStackView!
    @IBOutlet weak var socialLabel: UILabel!
    @IBOutlet weak var socialContainer: UIStackView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyContainer: UIStackView!

    var typesOfContacts: [String] = ["all", "n'Sync", "Following", "mohammed saieb skaik"]
    var typesOfContactsSelected = 0
    var cards: [String] = ["all", "Card 1", "Card 2", "Card 3", "Card 4", "Card 5", "Card 6", "Card 7", "Card 8", "Card 9"]
    var cardsSelected = 0
    var tags: [String] = ["all", "Favourite", "test", "Gamers", "Freinds"]
    var tagsSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func resetAction(_ sender: Any) {
        debugPrint(#function)
    }

    @IBAction func applyAction(_ sender: Any) {
        debugPrint(#function)
    }

    @objc private func countryAction() {
        let vc: TableViewController = TableViewController.instantiate(appStoryboard: .Second)
        vc.object = COUNTRY_TITLE
        vc.getData = { [weak self] title in
            self?.counrtyLabel.text = title
        }
        vc._push()
    }

    @objc private func socialAction() {
        let vc: TableViewController = TableViewController.instantiate(appStoryboard: .Second)
        vc.object = SOCAIL_NET_TITLE
        vc.getData = { [weak self] title in
            self?.socialLabel.text = title
        }
        vc._push()
    }

    @objc private func companyAction() {
        let vc: TableViewController = TableViewController.instantiate(appStoryboard: .Second)
        vc.object = COMPANY_TITLE
        vc.getData = { [weak self] title in
            self?.companyLabel.text = title
        }
        vc._push()
    }

}

// MARK: - ViewDidLoad
extension FiltersViewController {

    private func setUpView() {
        let mask = self.containerStack._roundCorners(isTopLeft: true, isTopRight: true)
        containerStack.layer.maskedCorners = mask
        self.setUpTypesCollectionView()
        self.setUpCardsCollectionView()
        self.setUpTagsCollectionView()
        let counrtyGesture = UITapGestureRecognizer(target: self, action: #selector(countryAction))
        self.counrtyContainer.addGestureRecognizer(counrtyGesture)
        let socialGesture = UITapGestureRecognizer(target: self, action: #selector(socialAction))
        self.socialContainer.addGestureRecognizer(socialGesture)
        let companyGesture = UITapGestureRecognizer(target: self, action: #selector(companyAction))
        self.companyContainer.addGestureRecognizer(companyGesture)
        self.navigationItem.hidesBackButton = true
    }

    private func setUpData() {
        self.filterLabel.text = FILTERS_TITLE
        self.typesContactsLabel.text = TYPES_CONTACT_TITLE
        self.cardsLabel.text = CARDS_TITLE
        self.tagsLabel.text = TAGS_TITLE
        self.counrtyLabel.text = COUNTRY_TITLE
        self.socialLabel.text = SOCAIL_NET_TITLE
        self.companyLabel.text = COMPANY_TITLE
    }

    private func setUpTypesCollectionView() {
        self.typesCollection.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 35)
        self.typesCollection._registerCell = TitleCollectionViewCell.self
    }
    private func setUpCardsCollectionView() {
        self.cardsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 35)
        self.cardsCollectionView._registerCell = TitleCollectionViewCell.self
    }
    private func setUpTagsCollectionView() {
        self.tagsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 35)
        self.tagsCollectionView._registerCell = TitleCollectionViewCell.self
    }

}

extension FiltersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typesCollection {
            return typesOfContacts.count
        } else if collectionView == self.cardsCollectionView {
            return cards.count
        }
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.typesCollection {
            let cell: TitleCollectionViewCell = self.typesCollection._dequeueReusableCell(for: indexPath)
            cell.object = self.typesOfContacts[indexPath.item]
            cell.isSelectedCell = self.typesOfContactsSelected == indexPath.item
            cell.configerCell()
            return cell
        } else if collectionView == self.cardsCollectionView {
            let cell: TitleCollectionViewCell = self.cardsCollectionView._dequeueReusableCell(for: indexPath)
            cell.object = self.cards[indexPath.item]
            cell.isSelectedCell = self.cardsSelected == indexPath.item
            cell.configerCell()
            return cell
        }
        let cell: TitleCollectionViewCell = self.tagsCollectionView._dequeueReusableCell(for: indexPath)
        cell.object = self.tags[indexPath.item]
        cell.isSelectedCell = self.tagsSelected == indexPath.item
        cell.configerCell()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.typesCollection {
            self.typesOfContactsSelected = indexPath.item
            self.typesCollection.reloadData()
        } else if collectionView == self.cardsCollectionView {
            self.cardsSelected = indexPath.item
            self.cardsCollectionView.reloadData()
        } else if collectionView == self.tagsCollectionView {
            self.tagsSelected = indexPath.item
            self.tagsCollectionView.reloadData()
        }
    }

}
