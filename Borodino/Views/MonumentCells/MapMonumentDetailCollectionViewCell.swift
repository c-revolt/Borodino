//
//  MapMonumentDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class MapMonumentDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.mapMonumentDetailCollectionViewIDCell
    
    private let monumentDetailMap: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with value: MGallery) {
        monumentDetailMap.text = value.role
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailMap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
