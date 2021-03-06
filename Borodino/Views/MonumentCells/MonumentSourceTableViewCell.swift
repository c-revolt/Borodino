//
//  MonumentSourceTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class MonumentSourceTableViewCell: UITableViewCell {

    static let reusedID = K.Monument.sourceReusedID
    
    private let iconSourceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.columns.circle")
        imageView.tintColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconSourceImageView)
        contentView.addSubview(sourceLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            iconSourceImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconSourceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconSourceImageView.widthAnchor.constraint(equalToConstant: 25),
            iconSourceImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            sourceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sourceLabel.leadingAnchor.constraint(equalTo: iconSourceImageView.trailingAnchor, constant: 5),
            sourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sourceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
        ])
    }
    

}
