//
//  MGallery.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import Foundation

struct MGallery: Decodable, Hashable {
    
    var id: Int
    var image: String
    var title: String
    var author: String
    var year: String
    var overview: String
    
}

