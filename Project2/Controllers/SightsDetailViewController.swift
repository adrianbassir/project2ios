//
//  SightsDetailViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/18/26.
//

import UIKit
import MapKit
import SnapKit

class SightsDetailViewController: UIViewController {
    
    var sight: Sight?
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(mapView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).dividedBy(3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        descriptionLabel.numberOfLines = 0
        imageView.contentMode = .scaleAspectFill
        
        if let sight = sight {
            
            title = sight.name
            
            imageView.image = UIImage(named: sight.imageName)
            
            descriptionLabel.text = sight.description
            
            let coordinate = CLLocationCoordinate2D(latitude: sight.latitude, longitude: sight.longitude) // Mapkit requirement in order to place annotation
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = sight.name
            
            mapView.addAnnotation(annotation)
            
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            mapView.setRegion(region, animated: true)
            
            
        }
    }


}
