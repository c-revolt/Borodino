//
//  PersonPortraitTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonPortraitTableViewCell: UITableViewCell {

    static let reusedID = K.Person.portraitReusedId
    
    let portraitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fr_p1")
//        imageView.layer.cornerRadius = 31
//        imageView.layer.borderWidth = 2
//        imageView.layer.borderColor = UIColor.mainGold().cgColor
        imageView.contentMode = .scaleAspectFit
        //imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    func configure(with value: MGallery) {
//        portraitImageView.image = UIImage(named: value.image ?? "photo")
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(portraitImageView)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            //portraitImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            portraitImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            portraitImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            portraitImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            portraitImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            portraitImageView.widthAnchor.constraint(equalToConstant: 350),
            portraitImageView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
