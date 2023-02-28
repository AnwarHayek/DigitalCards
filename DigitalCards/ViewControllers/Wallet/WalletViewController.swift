//
//  WalletViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 07/02/2023.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension WalletViewController {

    func setupView() {
        self.configuerNavigationItems()
        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView._registerCell = WalletCell.self
        self.tableView._registerHeaderAndFooter = WalletHeader.self
        let maskedCorners = self.view._roundCorners(isTopLeft: true, isTopRight: true)
        self.tableView.layer.maskedCorners = maskedCorners
        self.tableView.cornerRadius = 20
    }

}

extension WalletViewController {

    func configuerNavigationItems() {
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: ic_menu, style: .plain, target: self, action: #selector(menuAction)),
            self.barButtonItem(title: WALLET_TITLE)
        ]
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: ic_grennWallet, style: .plain, target: self, action: #selector(walletAction)),
            UIBarButtonItem(image: ic_addPeople, style: .plain, target: self, action: #selector(addAction)),
        ]
    }

    @objc func menuAction() {
        self._pop()
    }

    @objc func walletAction() {
        debugPrint(#function)
    }
    

    @objc func addAction() {
        let vc = ReferFriendViewController.instantiate(appStoryboard: .Third)
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc._presentVC()
    }
}


extension WalletViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WalletCell = tableView._dequeueReusableCell()
        cell.configerCell()
        return cell
    }

    // MARK: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: WalletHeader = tableView._dequeueReusableHeaderFooterView()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 186
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
