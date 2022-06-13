//
//  MonumetLocation.swift
//  Borodino
//
//  Created by Александр Прайд on 25.05.2022.
//

import UIKit
import MapKit
import Contacts

class MonumetLocation: NSObject, MKAnnotation {
    
    let id: Int?
    let title: String?
    let image: String?
    let content: String?
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int?, title: String?, image: String?, content: String?, coordinate: CLLocationCoordinate2D) {
        
        self.id = id
        self.title = title
        self.image = image
        self.content = content
        self.coordinate = coordinate
        
        super.init()
    }
    
    init?(object: MKGeoJSONFeature) {
        // создаём аннотацию из наших данных
        // получаем его свойства
        guard
            let point = object.geometry.first as? MKPointAnnotation,
            let propertiesData = object.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String: Any]
        else {
            return nil
        }
        
        id = properties["id"] as? Int
        title = properties["title"] as? String
        image = properties["image"] as? String
        content = properties["content"] as? String
        coordinate = point.coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return "content"
    }
    
    var mapitem: MKMapItem? {
        guard let location = title else {
            return nil
        }
        
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemarck = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemarck)
        mapItem.name = title

        return mapItem
    }
}
