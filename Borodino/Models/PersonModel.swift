//
//  PersonModel.swift
//  Borodino
//
//  Created by Александр Прайд on 13.06.2022.
//

import Foundation

struct Person: Decodable, Hashable {
    
    var id: Int
    var image: String
    var title: String
    var author: String
    var year: String
    var overview: String
    
}
