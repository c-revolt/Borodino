//
//  BattleOverviewTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import UIKit

class BattleOverviewTableViewCell: UITableViewCell {

    static let reusedId = K.Battle.overviewReusedID
    
    let battleOverviewLabel: UILabel = {
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
        
        contentView.addSubview(battleOverviewLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            battleOverviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            battleOverviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            battleOverviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            battleOverviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
