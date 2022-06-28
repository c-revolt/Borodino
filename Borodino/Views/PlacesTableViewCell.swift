//
//  PlacesTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    static let  reusedId: String = "PlacesTableViewCell"
    
    let placesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 21
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 19)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.columns.circle")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configure(with model: MonumentViewModel) {
        placesImageView.image = UIImage(named: model.image ?? "photo")
        titleLabel.text = model.title
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placesImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressIconImageView)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            placesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            placesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placesImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            addressIconImageView.topAnchor.constraint(equalTo: placesImageView.bottomAnchor, constant: 5),
            addressIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            addressIconImageView.widthAnchor.constraint(equalToConstant: 25),
            addressIconImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: placesImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: addressIconImageView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            //titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
