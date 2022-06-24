//
//  ImageMonumentDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class ImageMonumentDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.imageMonumentDetailCollectionViewIDCell
    
    private let monumentDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        //imageView.image = UIImage(named: "46m")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailImageView)
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentDetailImageView.frame = contentView.bounds
    }
    
    func configure(with value: MGallery) {
        monumentDetailImageView.image = UIImage(named: value.image ?? "photo")
    }
    
    
    private func applyConstraints () {
        NSLayoutConstraint.activate([
            monumentDetailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            monumentDetailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            monumentDetailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            monumentDetailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
