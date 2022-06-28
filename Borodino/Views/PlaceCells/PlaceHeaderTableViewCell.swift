//
//  PlaceHeaderTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 28.06.2022.
//

import UIKit

class PlaceHeaderTableViewCell: UITableViewCell {

    static let reusedId: String = K.Place.headerID

    private let overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "О Б З О Р"
        label.textColor = .gray
        label.textAlignment = .justified
        //label.font = UIFont(name: "Times New Romans", size: 20)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .darkGray
        contentView.addSubview(overviewTitleLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            overviewTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            overviewTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
        
        
    }
}
