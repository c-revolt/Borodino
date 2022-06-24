//
//  ImageMonumentDetailTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class ImageMonumentDetailTableViewCell: UITableViewCell {

    static let reusedIdentifire = "ImageMonumentDetailTableViewCell"
    
    private let imageMonumentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "46m")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageMonumentImageView)
        applyImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyImage() {
        NSLayoutConstraint.activate([
            imageMonumentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageMonumentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageMonumentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageMonumentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
