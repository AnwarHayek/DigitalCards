//  Skaik_mo
//
//  FindPeopleViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit
import GravitySliderFlowLayout

class FindPeopleViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var superStack: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var contacts: [Contact] = [
        .init(name: "محمد"),
        .init(name: "Mohammed"),
        .init(name: "Skaik"),
        .init(name: "Saieb"),
        .init(name: "Anwar"),
        .init(name: "ahmed"),
        .init(name: "iOS"),
        .init(name: "Yup"),
        .init(name: "Wow"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
        self.fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func searchAction(_ sender: Any) {
        self.closeButton.isHidden = self.textField._getText.isEmpty ? true : false
    }

    @IBAction func closeAction(_ sender: Any) {
        self.textField.text = ""
        self.closeButton.isHidden = true
    }

    @IBAction func filterAction(_ sender: Any) {
        debugPrint(#function)
    }
}

// MARK: - ViewDidLoad
extension FindPeopleViewController {

    private func setUpView() {
        self.configureCollectionView()
        self.closeButton.isHidden = true
    }

    private func configureCollectionView() {
        self.collectionView._registerCell = CardCollectionViewCell.self
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.superStack.layer.maskedCorners = maskedCorners
        self.collectionView.cornerRadius = 20
        self.collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)

    }

    private func setUpData() {
        let result = RESULT_TITLE
        self.resultLabel.text =  "\(contacts.count) \(result)"
    }

    private func fetchData() {

    }

}

extension FindPeopleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contacts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CardCollectionViewCell = collectionView._dequeueReusableCell(for: indexPath)
        cell.index = indexPath.item
        cell.contact = contacts[indexPath.item]
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
