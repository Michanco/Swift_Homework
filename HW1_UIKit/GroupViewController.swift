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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .gray
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        netvorkService.getGroups()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomGroupsCell()
    }
}
