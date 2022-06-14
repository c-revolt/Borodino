//
//  PaintingCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

protocol ConfiguringCell {
    static var resuedId: String { get }
    func configure(with value: MGallery)
}

class PaintingCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.paintingIdCell
    
    static let identifire = K.SectionTitles.paintings
    
    private let paintingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .brown
        //imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let paintingTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 14)
        label.numberOfLines = 0
        label.text = "Helo, world!"
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
        
        paintingImageView.frame = contentView.bounds
    }
    
    func configure(with value: MGallery) {
        paintingImageView.image = UIImage(named: value.image ?? "photo")
        paintingTitleLabel.text = value.title
    }
    
}

// MARK: - Setup UI Elements
extension PaintingCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(paintingImageView)
        contentView.addSubview(paintingTitleLabel)
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            paintingImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            paintingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            paintingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            paintingTitleLabel.topAnchor.constraint(equalTo: paintingImageView.bottomAnchor),
            paintingTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            paintingTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            paintingTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            paintingTitleLabel.heightAnchor.constraint(equalToConstant: 16)
        
        ])
        
    }
    
    
    
}

// MARK: - Configured with SDWebImages
