//
//  FriendsViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 13.02.2024.
//

import Foundation
import UIKit

final class FriendsViewController: UITableViewController{
    
    private var networkservice = NetworkService()
    private var models: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .gray
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(CustomFriendsCell.self, forCellReuseIdentifier: "Cell")
        
        networkservice.getFriends() { [weak self] friends in
            self?.models = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let cell = cell as? CustomFriendsCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupCell(friend: model)
        return cell
    }
}
