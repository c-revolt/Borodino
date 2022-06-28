//
//  MMonument.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import Foundation


struct MMonument: Decodable, Hashable {
    
    var id: Int?
    var title: String?
    var image: String?
    var address: String?
    var source: String?
    var overview: String?
    //var coord: [Double]?
    
}
