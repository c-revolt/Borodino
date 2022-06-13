//
//  PaintingModel.swift
//  Borodino
//
//  Created by Александр Прайд on 09.06.2022.
//

import Foundation

struct AppSection: Decodable, Hashable {
    let type: String
    let title: String
    let items: [Person]
}

struct Person2: Decodable, Hashable {
    
    var id: Int
    var image: String
    var title: String
    var author: String
    var year: String
    var overview: String
    
}

