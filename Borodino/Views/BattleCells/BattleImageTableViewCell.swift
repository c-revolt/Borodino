//
//  BattleImageTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import UIKit

class BattleImageTableViewCell: UITableViewCell {

    static let reusedID = K.Battle.imageReusedID

    let battleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    func configure(with value: MGallery) {
//        battleImageView.image = UIImage(named: value.image ?? "photo")
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(battleImageView)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            battleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            battleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            battleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            battleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
