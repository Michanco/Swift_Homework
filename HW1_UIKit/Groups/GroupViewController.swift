//
//  GroupViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 14.02.2024.
//

import Foundation
import UIKit

final class GroupViewController: UITableViewController{
    
    private var netvorkService = NetworkService()
    private var models: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .gray
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(CustomGroupsCell.self, forCellReuseIdentifier: "Cell")
        
        netvorkService.getGroups() { [weak self] groups in
            self?.models = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        5
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let cell = cell as? CustomGroupsCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupCell(group: model)
        return cell
    }
}
