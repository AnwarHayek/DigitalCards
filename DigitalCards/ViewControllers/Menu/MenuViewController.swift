//
//  MenuViewController.swift
//  DigitalCards
//
//  Created by Anwar Alhayek on 06/02/2023.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var backBarButton = UIBarButtonItem()

    var objects: [[(image: String, title: String, hint: String)]] = [[]]

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

extension MenuViewController {

    func setupView() {
        self.backBarButton = UIBarButtonItem(image: ic_exit, style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backBarButton

        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView._registerCell = MenuCell.self
        self.tableView._registerHeaderAndFooter = MenuHeader.self
        self.tableView._registerHeaderAndFooter = Separate.self
        let imageView = UIImageView.init(image: "ic_MenuBackground"._toImage)
        imageView.contentMode = .scaleAspectFill
        self.tableView.backgroundView = imageView

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            let contentSize = self.tableView.contentSize.height
            if contentSize > UIScreen.main.bounds.size.height {
                self.tableView.isScrollEnabled = true
            } else {
                self.tableView.isScrollEnabled = false
            }
        }
    }

    func localized() {

    }

    func setupData() {
        objects[0].append((image: "ic_wallet", title: "Wallet", hint: "23$"))
        objects[0].append((image: "ic_loyaltyProgram", title: "Loyalty Program", hint: "23 Point"))
        objects[0].append((image: "ic_membership", title: "Membership", hint: ""))
        objects[0].append((image: "ic_mySubscriptions", title: "My Subscriptions", hint: ""))

        objects.append([(image: "ic_FAQ", title: "FAQ", hint: "")])
        objects[1].append((image: "ic_aboutUs", title: "About Us", hint: ""))
        objects[1].append((image: "ic_contactUs", title: "Contact Us", hint: ""))
        objects[1].append((image: "ic_rateApp", title: "Rate App", hint: ""))
        objects.append([(image: "ic_logout", title: "Sign Out", hint: "")])
        self.tableView.reloadData()
    }

    func fetchData() {

    }

}
extension MenuViewController {

    @objc func back() {
        self._pop()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.item == 0 {
            let vc = WalletViewController.instantiate(appStoryboard: .Third)
            vc._push()
        }
        print(indexPath.item)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuCell = tableView._dequeueReusableCell()
        cell.object = objects[indexPath.section][indexPath.row]
        cell.section = indexPath.section
        cell.configerCell()
        return cell
    }

    // MARK: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header1: MenuHeader = tableView._dequeueReusableHeaderFooterView()
        let header2: Separate = tableView._dequeueReusableHeaderFooterView()
        return section == 0 ? header1 : header2
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 269 : 21
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}