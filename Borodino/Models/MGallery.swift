//
//  MGallery.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import Foundation

struct MGallery: Decodable, Hashable {
    
    var id: Int?
    var image: String?
    var title: String?
    var role: String?
    var years: String?
    var emblem: String?
    var overview: String?
    var address: String?
    var geometry: Geometry?
}

struct Geometry: Decodable, Hashable {
    var coord: [Double]?
}

