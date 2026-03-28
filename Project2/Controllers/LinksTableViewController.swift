//
//  LinksTableViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit

class LinksTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Links"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LinkCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCell", for: indexPath)
        cell.textLabel?.text = "Link \(indexPath.row + 1)"
        return cell
    }
    
}
