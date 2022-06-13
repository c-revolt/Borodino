//
//  Constant.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import Foundation
import UIKit

struct K {
    
    static let collectionViewInTableViewCell = "CollectionViewInTableViewCell"
    
    struct SectionTitles {
        static let paintings = "Картины Художников"
        static let presons = "Персоны"
        static let monuments = "Памятники"
        static let places = "Места"
        static let interesting = "Интересное"
    }
    
    
    
    static let gallery_ID_cell = "GalleryIDCell"
    static let publication_ID_cell = "PublicationIDCell"
    
    struct NavControllerTitle {
        static let gallery_title = "Галерея"
        static let map_title = "Карта"
        static let info_title = "Info"
        static let description_of_publication_title = "Описание"
    }
    
    struct tabBarImageTitles {
        static let gallery_controller = UIImage(systemName: "photo.on.rectangle.angled")
        static let map_contoller = UIImage(systemName: "map.fill")
        static let info_controller = UIImage(systemName: "info.circle.fill")
    }
    
    struct ImagesTitle {
        
        static let titleImage = "title_image_pmva"
        static let firstImage = "1_eg_plk_1-19"
        static let secondImage = "2_art_brig"
        static let thirdImage = "3_kaz_gv"
        static let fourthImage = "4_7_peh_deviz"
        static let fifthImage = "5_nezhynskomy_dragunskomu_polku"
    }
}
