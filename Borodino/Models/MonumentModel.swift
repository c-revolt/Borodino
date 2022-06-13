//
//  MonumentModel.swift
//  Borodino
//
//  Created by Александр Прайд on 23.05.2022.
//

import Foundation

struct Monument: Decodable {
        
    var id: Int
    var title: String
    var image: String
    var content: String
    var coordinate: [Double]
}

struct TestMonument: Decodable {
    
    var objects: [Object]
}

struct Object: Decodable {
    
    var id: Int
    var title: String
    var image: String
    var content: String
    var coordinate: [Double]
}
