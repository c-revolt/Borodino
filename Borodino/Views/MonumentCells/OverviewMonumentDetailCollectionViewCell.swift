//
//  OverviewMonumentDetailCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class OverviewMonumentDetailCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.overviewMonumentDetailCollectionViewIDCell
    
    private let monumentDetailOverviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with value: MGallery) {
        monumentDetailOverviewLabel.text = value.overview
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(monumentDetailOverviewLabel)
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monumentDetailOverviewLabel.frame = contentView.bounds
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            monumentDetailOverviewLabel.topAnchor.constraint(equalTo: self.topAnchor),
            monumentDetailOverviewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            monumentDetailOverviewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            monumentDetailOverviewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
