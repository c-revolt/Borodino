//
//  PersonNameTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonNameTableViewCell: UITableViewCell {

    static let reusedID = K.Person.nameReusedId

    let personNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Наполеон Бонапарт"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Romans", size: 20)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    func configure(with value: MGallery) {
//        personNameLabel.text = value.title
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(personNameLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
        
            personNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            personNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            personNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
