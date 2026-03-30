//
//  LinksTableViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit

struct Link {
    let name: String
    let url: String
}

class LinksTableViewController: UITableViewController {
    
    let links : [Link] = [
        Link(name: "Church Street Marketplace", url: "https://www.churchstreetmarketplace.com"),
        Link(name: "ECHO Museum", url: "https://www.echovermont.org"),
        Link(name: "Burlington City Arts", url: "https://www.burlingtoncityarts.org"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Links"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LinkCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCell", for: indexPath)
        
        if indexPath.row < links.count {
            cell.textLabel?.text = links[indexPath.row].name
        } else {
            cell.textLabel?.text = "Credits"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < links.count {
            let link = links[indexPath.row]
            if let url = URL(string: link.url) {
                // UIApplication.shared.open: https://developer.apple.com/documentation/uikit/uiapplication/open(_:options:completionhandler:)
                UIApplication.shared.open(url)
            }
        } else {
            navigationController?.pushViewController(CreditsViewController(), animated: true)
        }
    }
    
}
