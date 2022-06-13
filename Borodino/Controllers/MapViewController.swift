//
//  MapViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 09.05.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView = MKMapView()
    //let monuments = Bundle.main.decode([Monument].self, from: "monuments.json")
//    var monumentsData: TestMonument?
//    var monumentsCoordinates: [CLLocation] = []
    
    var monuments: [MonumetLocation] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUIElements()
        setupStartCoordinate()
        
//        if let monumentJSON = self.getJSONData() {
//            parseJSON(jsonData: monumentJSON)
//        }
        
    }
}

// MARK: - Setup UI Elements
extension MapViewController {
    
    private func setupUIElements() {
        setupNavigationBar()
        setupMapView()
    }
    
    private func setupNavigationBar() {

        title = K.NavControllerTitle.map_title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupStartCoordinate() {
        
        let initialLocation = CLLocation(latitude: 55.517984199818144, longitude: 35.822711893535356)
        mapView.centerLocation(initialLocation)
        
        // borders
        let cameraCenter = CLLocation(latitude: 55.517984199818144, longitude: 35.822711893535356)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 50_000, longitudinalMeters: 50_000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        // scale
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 15_000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        
        let mon = MonumetLocation(id: nil, title: "Музей", image: nil, content: nil, coordinate: CLLocationCoordinate2D(latitude: 55.517984199818144, longitude: 35.822711893535356))
        
        mapView.addAnnotation(mon)
        
        loadInitialData()
        mapView.addAnnotations(monuments)
    }
    
    private func loadInitialData() {
        guard
            let monumetsFilePath = Bundle.main.url(forResource: "mainData", withExtension: "geojson"),
            let monumentsData = try? Data(contentsOf: monumetsFilePath)
        else {
            
            return
        }

        do {
            let features = try MKGeoJSONDecoder()
                .decode(monumentsData)
                .compactMap{ $0 as? MKGeoJSONFeature }
            let validWorks = features.compactMap(MonumetLocation.init)
            monuments.append(contentsOf: validWorks)
            
        } catch {
            print("🔴\(error)")
        }
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    
//    func getJSONData() -> Data? {
//
//        if let path = Bundle.main.path(forResource: "monuments", ofType: "json") {
//
//            do {
//                let data = try String(contentsOfFile: path).data(using: .utf8)
//                print("🟢 SUCCESS: JSON read successfully")
//                return data
//            } catch {
//                print("🔴 ERROR: Unable to read JSON")
//            }
//        }
//        return nil
//    }
//
//    func parseJSON(jsonData: Data) {
//        do {
//            monumentsData = try JSONDecoder().decode(TestMonument.self, from: jsonData)
//
//
//
//            for object in monumentsData?.objects ?? [] {
//                let location = CLLocation(latitude: object.coordinate[1],
//                                          longitude: object.coordinate[0])
//
//                let title = object.title
//                let image = object.image
//                let content = object.content
//                // add new element
//                monumentsCoordinates.append(location)
//                monumentsCoordinates.append(title)
//                monumentsCoordinates.append(image)
//                monumentsCoordinates.append(content)
//
//               // let monument = TestMonument(
//            }
//        } catch {
//            print("🔴 ERROR; Unable to parse JSON")
//
//        }
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // делаем проверку, является ли аннотация объектом MonumentLocation
        guard let annotation = annotation as? MonumetLocation else {
            return nil
        }

        // создём идентификатор, чтобы поместить аннотацию во внутреннюю очередь
        let identifier = "mapMonuments"
        // для правильного отображения view мы его относим к MKMarkerAnnotationView
        let view: MKMarkerAnnotationView

        // делаем проверку, где если нам удаётся поместить нашу аннотацию во внутреннюю очередь с нашим идентификатором,
        // если нет, то помещаем его в кнопку
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "mapMonuments") as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            // отобразить описание маркера
            view.canShowCallout = true
            // расположеине описания
            view.calloutOffset = CGPoint(x: -5, y: 5)
            //
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let monumetOnMap = view.annotation as? MonumetLocation else {
            return
        }

        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        monumetOnMap.mapitem?.openInMaps(launchOptions: launchOption)
    }
}
