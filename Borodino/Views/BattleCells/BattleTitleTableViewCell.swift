//
//  BattleTitleTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import UIKit

class BattleTitleTableViewCell: UITableViewCell {

    static let reusedId = K.Battle.titleReusedID
    
    let battleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        //label.font = UIFont(name: "Times New Romans", size: 22)
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(battleTitleLabel)
        applyConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([

            battleTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            battleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            battleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            battleTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
