//  Skaik_mo
//
//  NotificationsViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 05/02/2023.
//

import UIKit

class NotificationsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var objects: [Notification] = [
        .init(title: "Title 1", body: "Body", createdAt: "05/02/2023"),
        .init(title: "Title 2", body: "Body 1\nBody 2", createdAt: "28/02/2023"),
        .init(title: "Title 3", body: "Line 1\nLine 2\nLine 3....", createdAt: "27/02/2023"),
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
extension NotificationsViewController {

    private func setUpView() {
        self.tableView._registerCell = NotificationsTableViewCell.self
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }

    private func setUpData() {
        self.title = NOTIFI_TITLE
    }

}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationsTableViewCell = tableView._dequeueReusableCell()
        cell.object = self.objects[indexPath.item]
        cell.configerCell()
        return cell
    }

}
