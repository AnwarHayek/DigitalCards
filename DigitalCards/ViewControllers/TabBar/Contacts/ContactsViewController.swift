//  Skaik_mo
//
//  ContactsViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit

class ContactsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var subStack: UIStackView!
    var contacts: [Contacts] = [
            .init(alphabet: "#", contacts: [.init(name: "محمد")]),
            .init(alphabet: "M", contacts: [.init(name: "Mohammed")]),
            .init(alphabet: "S", contacts: [.init(name: "Skaik"), .init(name: "Saieb")]),
            .init(alphabet: "A", contacts: [.init(name: "Anwar"), .init(name: "ahmed"), .init(name: "AAA")]),
            .init(alphabet: "I", contacts: [.init(name: "iOS")]),
            .init(alphabet: "Z", contacts: [.init(name: "Zoom")]),
            .init(alphabet: "Y", contacts: [.init(name: "Yup")]),
            .init(alphabet: "W", contacts: [.init(name: "Wow")]),
    ]
    var isCardView = false
//    var contactsIndexTitles: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func filterAction(_ sender: Any) {
        debugPrint(#function)
        let vc: FiltersViewController = FiltersViewController.instantiate(appStoryboard: .Second)
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .custom
//        vc._presentVC()
        vc._push()
    }

}

// MARK: - ViewDidLoad
extension ContactsViewController {

    private func setUpView() {
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.subStack.layer.maskedCorners = maskedCorners
        self.setUpTableView()
    }

    private func setUpData() {
        contacts = contacts.sorted(by: >)
        contacts.insert(.init(alphabet: "Favourite", contacts: [.init(name: "Mohammed Skaik"), .init(name: "Anwar Alhayek")]), at: 0)
//        self.contacts.forEach { contact in
//            if let alphabet = contact.alphabet {
//                self.contactsIndexTitles.append(alphabet)
//            }
//        }
    }

    private func setUpTableView() {
        self.tableView._registerCell = ContactsTableViewCell.self
        self.tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)
        self.tableView.sectionHeaderTopPadding = 10
    }

}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Section
    func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = color_FFFFFF

        let label = UILabel(frame: CGRect(x: 18, y: 0, width: view.frame.width - 18, height: 30))
        label.font = Sora_SemiBold14
        label.text = contacts[section].alphabet
        view.addSubview(label)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    // MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactsTableViewCell = tableView._dequeueReusableCell()
        cell.object = contacts[indexPath.section].contacts[indexPath.item]
        cell.configerCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !contacts[indexPath.section].contacts[indexPath.item].isHiddenCard && isCardView {
            return 310
        }
        return 52
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.isCardView else { return }
        debugPrint(#function)
        tableView.beginUpdates()
        contacts[indexPath.section].contacts[indexPath.item].isHiddenCard.toggle()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        tableView.endUpdates()
    }

//    // MARK: - Indicator
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return self.contactsIndexTitles
//    }
//
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        return self.contactsIndexTitles.firstIndex(of: title) ?? NSNotFound
//    }

}
