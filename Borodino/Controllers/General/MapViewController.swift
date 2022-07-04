//
//  MapViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 29.06.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    var battleJSONData = Bundle.main.decode(MGallery.self, from: "battleEpisodes.json")
    var battleData: MGallery?
    var battleCoordinates: [CLLocation] = []
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        applyConstraints()
    }
    
    

    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
    
    
    

}
