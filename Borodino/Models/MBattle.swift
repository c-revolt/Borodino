//
//  MBattle.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import Foundation

struct MBattle: Decodable, Hashable {
    
    var id: Int?
    var image: String?
    var title: String?
    var overview: String?
    var geometria: Geometria?
}

struct Geometria: Decodable, Hashable {
    var coord: [Double]?
}
