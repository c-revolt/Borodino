//
//  TitleMonumentDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class TitleMonumentDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.titleMonumentDetailCollectionViewIDCell
    
    private let monumentDetailTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with value: MGallery) {
        monumentDetailTitleLabel.text = value.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailTitleLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentDetailTitleLabel.frame = contentView.bounds
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            monumentDetailTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            monumentDetailTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            monumentDetailTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            monumentDetailTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
