//
//  PlaceAddressTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 28.06.2022.
//

import UIKit

class PlaceAddressTableViewCell: UITableViewCell {

    static let reusedId: String = K.Place.addressRusedID

    private let addressIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressIconImageView)
        contentView.addSubview(addressLabel)
        
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            addressIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addressIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addressIconImageView.widthAnchor.constraint(equalToConstant: 25),
            addressIconImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: addressIconImageView.trailingAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
