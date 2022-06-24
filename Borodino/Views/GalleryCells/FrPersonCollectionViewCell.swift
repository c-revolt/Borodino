//
//  FrPersonCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit


class FrPersonCollectionViewCell: UICollectionViewCell, ConfiguringCell  {
    
    static var resuedId = K.frPersonIDCell

    
    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 31
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let personTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personRoleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 13)
        label.font = .italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personEmblermImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        applyConstraints()
        
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.cornerRadius = 7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        personImageView.frame = contentView.bounds
    }
    
    func configure(with value: MGallery) {
        
        personImageView.image = UIImage(named: value.image ?? "photo")
        personTitleLabel.text = value.title
        personRoleLabel.text = value.role
        personEmblermImage.image = UIImage(named: value.emblem ??  "photo")
    }
}

extension FrPersonCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(personImageView)
        contentView.addSubview(personTitleLabel)
        contentView.addSubview(personRoleLabel)
        contentView.addSubview(personEmblermImage)
        contentView.addSubview(gradientView)
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            personImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            personImageView.widthAnchor.constraint(equalToConstant: 60),
            personImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            personTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            personTitleLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 5),
            personTitleLabel.trailingAnchor.constraint(equalTo: personEmblermImage.leadingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            personRoleLabel.topAnchor.constraint(equalTo: personTitleLabel.bottomAnchor, constant: 3),
            personRoleLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 5),
            personRoleLabel.trailingAnchor.constraint(equalTo: personEmblermImage.leadingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 84),
            gradientView.widthAnchor.constraint(equalToConstant: 6)
        ])
        
        NSLayoutConstraint.activate([
            personEmblermImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personEmblermImage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -7),
            personEmblermImage.heightAnchor.constraint(equalToConstant: 40),
            personEmblermImage.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}


