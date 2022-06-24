//
//  AddressMonumentDetailTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class AddressMonumentDetailTableViewCell: UITableViewCell {

    static let reeusedIdentifire = "AddressMonumentDetailTableViewCell"
    
    private let addressIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Московская область, Можайский городской округ, деревня Шевардино"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
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
            addressIconImageView.widthAnchor.constraint(equalToConstant: 30),
            addressIconImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: addressIconImageView.trailingAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
