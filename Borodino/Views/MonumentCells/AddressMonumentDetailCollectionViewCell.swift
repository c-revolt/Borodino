//
//  AddressMonumentDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class AddressMonumentDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    
    static var resuedId = K.addressMonumentDetailCollectionViewIDCell
    
    private let monumentDetailIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        imageView.tintColor = .mainGold()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentDetailAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with value: MGallery) {
        monumentDetailAddressLabel.text = value.emblem
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailIconImageView)
        contentView.addSubview(monumentDetailAddressLabel)
        applyConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentDetailIconImageView.frame = contentView.bounds
        monumentDetailAddressLabel.frame = contentView.bounds
        
    }
    
    private func applyConstraint() {
        
        NSLayoutConstraint.activate([
            monumentDetailIconImageView.widthAnchor.constraint(equalToConstant: 40),
            monumentDetailIconImageView.heightAnchor.constraint(equalToConstant: 40),
            monumentDetailIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            monumentDetailAddressLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            monumentDetailAddressLabel.leadingAnchor.constraint(equalTo: monumentDetailIconImageView.trailingAnchor, constant: 10),
            monumentDetailAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            monumentDetailAddressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
}
