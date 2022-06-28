//
//  PersonEmblemTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonEmblemTableViewCell: UITableViewCell {

    static let reusedID = K.Person.emblemReusedId
    
    let emblemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "f_emblem_1")
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    func configure(with value: MGallery) {
//        emblemImageView.image = UIImage(named: value.emblem ?? "photo")
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(emblemImageView)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            emblemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emblemImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emblemImageView.widthAnchor.constraint(equalToConstant: 100),
            emblemImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
