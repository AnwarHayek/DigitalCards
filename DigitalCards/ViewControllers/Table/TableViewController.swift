//  Skaik_mo
//
//  TableViewController.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 26/02/2023.
//

import UIKit

class TableViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var object: String?
    var getData: ((String?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - ViewDidLoad
extension TableViewController {
    
    private func setUpTableView() {
        self.tableView._registerCell = TitleTableViewCell.self
    }
    
    private func setUpData() {
        if let object {
            self.title = object + " Page"
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if object == nil {
            return 0
        }
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TitleTableViewCell = tableView._dequeueReusableCell()
        cell.object = (self.object ?? "") + " \(indexPath.item + 1)"
        cell.configerCell()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TitleTableViewCell, let title = cell.object else { return }
        self.getData?(title)
        self._pop()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }


}
