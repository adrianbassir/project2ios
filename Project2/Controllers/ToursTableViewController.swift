//
//  ToursTableViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit

class ToursTableViewController: UITableViewController {
    
    let tours = [
        Tour(title: "Church Street Video Tour", fileName: "churchStreetAudioTour", isVideo: true),
        Tour(title: "Burlington Audio Tour", fileName: "burlingtonVideoTour", isVideo: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tours"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let tour = tours[indexPath.row]
        
        if tour.isVideo {
            cell.textLabel?.text = "Video \(tour.title)"
        } else {
            cell.textLabel?.text = "Audio \(tour.title)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ToursDetailViewController()
        detailVC.tour = tours[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
