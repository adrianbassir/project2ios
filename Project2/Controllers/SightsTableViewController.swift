//
//  SightsTableViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit

class SightsTableViewController: UITableViewController {
    
    let sights: [Sight] = [
        Sight(name: "Church Street Marketplace", description: "Walkable area with many popular shops and restaurants in downtown Burlington", imageName: "churchstreet", latitude: 44.476359, longitude: -73.2127379),
        Sight(name: "Waterfront Park", description: "A park down at Lake Champlain with a walking area, chairs to sit as well as pier", imageName: "waterfrontpark", latitude: 44.4794814, longitude: -73.2220263),
        Sight(name: "Battery Park", description: "Historic park in Burlington which features a playground among many walking trails", imageName: "batterypark", latitude: 44.4813192, longitude: -73.2203523),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sights"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sights.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sights[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = SightsDetailViewController()
        detailVC.sight = sights[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
