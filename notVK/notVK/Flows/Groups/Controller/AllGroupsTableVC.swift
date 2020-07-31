//
//  AllGroupsTableViewController.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UIViewController {

    
    @IBOutlet private weak var tableView: UITableView!
    
    let allGroups = [GroupItemClass]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

}

extension AllGroupsTableViewController: UITableViewDelegate {
    
}

extension AllGroupsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsTableViewCell

        let group = allGroups[indexPath.row]
        cell.friendName.text = group.name
        if let photoURL = URL(string: (group.photo50 ?? "")) {
            cell.friendPhoto.image.image = UIImage(data: try! Data(contentsOf: photoURL as URL))
        }
        
        return cell
    }
    
}
