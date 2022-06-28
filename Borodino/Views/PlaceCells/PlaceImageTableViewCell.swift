//
//  PlaceImageTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 28.06.2022.
//

import UIKit

class PlaceImageTableViewCell: UITableViewCell {

    static let reusedId: String = K.Place.imageReusedID

    let placeImageView: UIImageView = {
        let imageView = UIImageView()
    
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeImageView)
        applyImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: MMonument) {
        placeImageView.image = UIImage(named: value.image ?? "photo")
    }
    
    private func applyImage() {
        NSLayoutConstraint.activate([
            placeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            placeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
