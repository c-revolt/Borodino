//
//  SourceMonumetDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class SourceMonumetDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    
    static var resuedId = K.sourceMonumentDetailCollectionViewIDCell
    
    private let monumentDetailIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.columns.circle")
        imageView.tintColor = .mainGold()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentDetailSourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func configure(with value: MGallery) {
        monumentDetailSourceLabel.text = value.years
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailIconImageView)
        contentView.addSubview(monumentDetailSourceLabel)
        applyContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentDetailIconImageView.frame = contentView.bounds
        monumentDetailSourceLabel.frame = contentView.bounds
        
    }
    
    private func applyContraints() {
        
        NSLayoutConstraint.activate([
            monumentDetailIconImageView.widthAnchor.constraint(equalToConstant: 40),
            monumentDetailIconImageView.heightAnchor.constraint(equalToConstant: 40),
            monumentDetailIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            monumentDetailSourceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            monumentDetailSourceLabel.leadingAnchor.constraint(equalTo: monumentDetailIconImageView.trailingAnchor, constant: 10),
            monumentDetailSourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            monumentDetailSourceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
