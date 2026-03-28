//
//  RootTabBarController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/18/26.
//

import UIKit
import SnapKit

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        
        let sights = UINavigationController(rootViewController: SightsTableViewController())
        sights.tabBarItem = UITabBarItem(title: "Sights", image: UIImage(systemName: "map"), tag: 0)
        
        let tours = UINavigationController(rootViewController: ToursTableViewController())
        tours.tabBarItem = UITabBarItem(title: "Tours", image: UIImage(systemName: "airplayaudio"), tag: 1)
        
        let notes = UINavigationController(rootViewController: NotesTableViewController())
        notes.tabBarItem = UITabBarItem(title: "Notes", image: UIImage(systemName: "pencil"), tag: 2)
        
        let favorites = UINavigationController(rootViewController: FavoritesTableViewController())
        favorites.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 3)

        let links = UINavigationController(rootViewController: LinksTableViewController())
        links.tabBarItem = UITabBarItem(title: "Links", image: UIImage(systemName: "arrow.2.circlepath.circle"), tag: 4)
        
        viewControllers = [sights, tours, notes, favorites, links]
        
    }
}
