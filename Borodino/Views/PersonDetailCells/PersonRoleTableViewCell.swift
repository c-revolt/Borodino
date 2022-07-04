//
//  PersonRoleTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 28.06.2022.
//

import UIKit

class PersonRoleTableViewCell: UITableViewCell {

    static let reusedID = K.Person.roleReusedId

    let personRoleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 13)
        label.font = .italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(personRoleLabel)
        applyConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applyConstraint() {
        
        NSLayoutConstraint.activate([
            personRoleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            personRoleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personRoleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            personRoleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
        ])
        
    }
}
