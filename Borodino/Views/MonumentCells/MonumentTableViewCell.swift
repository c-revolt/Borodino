//
//  MonumentTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class MonumentTableViewCell: UITableViewCell {

    static let reusedId = K.Monument.monumentTableViewCellReusedID
    
    private let monImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 31
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemYellow.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        //label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconSourceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.columns.circle")
        imageView.tintColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(monImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconSourceImageView)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(addressIconImageView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(gradientView)
        //contentView.addSubview(separatorView)
        
        applyConstraints()
    }
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with model: MonumentViewModel) {
        monImageView.image = UIImage(named: model.image ?? "photo")
        titleLabel.text = model.title
        sourceLabel.text = model.source
        addressLabel.text = model.address
        
    }
    
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            monImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            monImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            monImageView.widthAnchor.constraint(equalToConstant: 60),
            monImageView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: monImageView.trailingAnchor, constant: 7),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            
        ])
        
        NSLayoutConstraint.activate([
            iconSourceImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            iconSourceImageView.leadingAnchor.constraint(equalTo: monImageView.trailingAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            sourceLabel.leadingAnchor.constraint(equalTo: iconSourceImageView.trailingAnchor, constant: 5)
            
        ])
        
        NSLayoutConstraint.activate([
            addressIconImageView.topAnchor.constraint(equalTo: iconSourceImageView.bottomAnchor, constant: 3),
            addressIconImageView.leadingAnchor.constraint(equalTo: monImageView.trailingAnchor, constant: 7)
            
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: addressIconImageView.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 84),
            gradientView.widthAnchor.constraint(equalToConstant: 6)
        ])
        
//        NSLayoutConstraint.activate([
//            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 75),
//            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            separatorView.heightAnchor.constraint(equalToConstant: 1)
//        ])
        
    }

}
