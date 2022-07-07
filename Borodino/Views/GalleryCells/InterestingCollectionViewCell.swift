//
//  InterestingCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

class InterestingCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.Gallery.interestingReusedID
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .brown
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleImageView.frame = contentView.bounds
    }
    
    func configure(with value: MGallery) {
        titleImageView.image = UIImage(named: value.image ?? "photo")
        titleLabel.text = value.overview
    }
    
}

// MARK: - Setup UI Elements
extension InterestingCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(titleImageView)
        createGradient()
        addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        
        ])
        
    }
    
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

