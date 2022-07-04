//
//  OverviewMonumentDetailTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class MonumentOverviewTableViewCell: UITableViewCell {

    
    static var resuedIdentifire = "OverviewMonumentDetailTableViewCell"
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .natural
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(overviewLabel)
        applyConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }

}
