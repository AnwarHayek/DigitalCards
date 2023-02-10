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
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        self.contacts = self.contacts.sorted(by: >)
        self.contacts.insert(.init(alphabet: "Favourite", contacts: [.init(name: "Mohammed Skaik"), .init(name: "Anwar Alhayek")]), at: 0)
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
        self.contacts.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = color_FFFFFF

        let label = UILabel(frame: CGRect(x: 18, y: 0, width: view.frame.width - 18, height: 30))
        label.font = Sora_SemiBold14
        label.text = self.contacts[section].alphabet
        view.addSubview(label)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    // MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.contacts[section].contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactsTableViewCell = tableView._dequeueReusableCell()
        cell.object = self.contacts[indexPath.section].contacts[indexPath.item]
        cell.configerCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.contacts[indexPath.section].contacts[indexPath.item].isHiddenCard {
            return 52
        }
        return 310
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(#function)
        tableView.beginUpdates()
        self.contacts[indexPath.section].contacts[indexPath.item].isHiddenCard.toggle()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        tableView.endUpdates()
    }
}
