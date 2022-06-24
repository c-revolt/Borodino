//
//  MonumentTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 20.06.2022.
//

import UIKit

protocol MonumentCollectionViewCellDelegate: AnyObject {
    
    func MonumentCollectionViewCellDidTappedCell(_ cell: MonumentCollectionViewCell, viewModel: MonumentViewModel)
}

class MonumentCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.monumentCollectionViewIDCell
    weak var delegate: MonumentCollectionViewCellDelegate?
    
    private let monumentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        //imageView.layer.borderWidth = 1
        //imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let monumentOverViewLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Avenir", size: 13)
//        label.textAlignment = .left
//        label.textColor = .lightGray
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
    func configure(with value: MGallery) {
        monumentImageView.image = UIImage(named: value.image ?? "photo")
        monumentTitleLabel.text = value.title
        //monumentOverViewLabel.text = value.overview
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()

        applyConstraints()
        
        //backgroundColor = .darkGray
        //layer.cornerRadius = 7
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentImageView.frame = contentView.bounds
    }

}

// MARK: - Setup UI Elements
extension MonumentCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(monumentImageView)
        createGradient()
        contentView.addSubview(monumentTitleLabel)
        //contentView.addSubview(monumentOverViewLabel)
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            monumentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            monumentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            monumentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //monumentImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            
            monumentTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            monumentTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            monumentTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
                
//        NSLayoutConstraint.activate([
//            monumentOverViewLabel.topAnchor.constraint(equalTo: monumentTitleLabel.bottomAnchor, constant: 15),
//            monumentOverViewLabel.leadingAnchor.constraint(equalTo: monumentImageView.trailingAnchor, constant: 5),
//            monumentOverViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//            monumentOverViewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
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
