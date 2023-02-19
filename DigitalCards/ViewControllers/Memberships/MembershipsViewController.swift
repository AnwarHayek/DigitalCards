//
//  MembershipsViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 08/02/2023.
//

import UIKit

class MembershipsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var backBarButton = UIBarButtonItem()

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

}

extension MembershipsViewController {

    func setupView() {
        self.configuerNavigationItems()
        //tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView._registerCell = MembershipsCell.self
        self.tableView._registerCell = MaximumNumberCell.self
        self.tableView._registerHeaderAndFooter = MembershipsHeader.self
        self.tableView._registerHeaderAndFooter = MembershipsSeparateHeader.self
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.tableView.layer.maskedCorners = maskedCorners
        self.tableView.cornerRadius = 20
    }

    func localized() {

    }

    func setupData() {

    }

    func fetchData() {

    }

}

extension MembershipsViewController {

    @objc func back() {
        self._pop()
    }

    func configuerNavigationItems() {
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: ic_menu, style: .plain, target: self, action: #selector(back)),
            self.barButtonItem(title: "Memberships")
        ]
    }
}

extension MembershipsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 0 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1: MaximumNumberCell = tableView._dequeueReusableCell()
        let cell2: MembershipsCell = tableView._dequeueReusableCell()
        cell2.section = indexPath.section
        cell1.configerCell()
        cell2.configerCell()
        return indexPath.section == 1 ? cell1 : cell2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header1: MembershipsHeader = tableView._dequeueReusableHeaderFooterView()
        let header2: MembershipsSeparateHeader = tableView._dequeueReusableHeaderFooterView()
        header2.section = section
        header2.configerHeader()
        return section == 0 ? header1 : header2
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 697 : 42
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}


