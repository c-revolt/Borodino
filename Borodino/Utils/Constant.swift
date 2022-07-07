//
//  Constant.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import Foundation
import UIKit

struct K {
        
    static let sectionHeader = "SectionHeader"
    
    struct TabBarTitles {
        static let gallery = "Галерея"
        static let monuments = "Монументы"
        static let places = "Места"
    }
    
    struct Gallery {
        static let battleSectionTitle = "ХРОНОЛОГИЯ БИТВЫ"
        static let russianSideSectionTitle = "Российская сторона"
        static let russianCommandersSectionTitle = "Российские командующие"
        static let frenchSideSectionTitle = "Французская сторона"
        static let frenchCommandersSectionTitle = "Французские командующие"
        static let interestingSectionTitle = "Интересное"
        
        static let episodesReusedID = "BattleEpisodeCollectionViewCell"
        static let russianSideReusedID = "RussianSideDataCell"
        static let russianCommandersReusedID = "RussianCommandersCollectionViewCell"
        static let frenchSideReusedID = "FrenchSideDataCell"
        static let frenchCommanderReusedID = "FrenchCommandersCollectionViewCell"
        static let interestingReusedID = "InterestingCollectionViewCell"
    }
    
    struct Person {
        static let portraitReusedId = "PersonPortraitTableViewCell"
        static let nameReusedId = "PersonNameTableViewCell"
        static let roleReusedId = "PersonRoleTableViewCell"
        static let datesReusedId = "PersonDatesTableViewCell"
        static let emblemReusedId = "PersonEmblemTableViewCell"
        static let overviewReusedId = "PersonOverviewTableViewCell"
    }
    
    struct Battle {
        static let imageReusedID = "BattleImageTableViewCell"
        static let titleReusedID = "BattleTitleTableViewCell"
        static let overviewReusedID = "BattleOverviewTableViewCell"
        static let placemarkReusedID = "BattlePlacemarkTableViewCell"
        static let mapReusedID = "BattleMapTableViewCell"
    }
    
    struct Monument {
        
        static let monumentTableViewCellReusedID = "MonumentTableViewCell"
        
        static let imageReusedID = "MonumentImagelTableViewCell"
        static let titleReusedID = "MonumentTItleTableViewCell"
        static let sourceReusedID = "MonumentSourceTableViewCell"
        static let addressReusedID = "MonumentAddressTableViewCell"
        static let headerReusedID = "MonumentHeaderTableViewCell"
        static let overviewReusedID = "MonumentOverviewTableViewCell"
        static let bottomHeaderReusedID = "MonumentBottomHeaderTableViewCell"
        static let mapReusedID = "MonumentMapTableViewCell"
    }
    
    struct Place {
        static let imageReusedID = "PlaceImageTableViewCell"
        static let titleReusedID = "PlaceTitleTableViewCell"
        static let addressRusedID = "PlaceAddressTableViewCell"
        static let headerID = "PlaceHeaderTableViewCell"
        static let overviewReusedID = "PlaceOverviewTableViewCell"
        static let bottomHeaderReusedID = "PlaceBottomHeaderTableViewCell"
        static let mapReusedID = "PlaceMapTableViewCell"
    }
    
}
