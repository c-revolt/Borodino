//
//  PersonDatesTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonDatesTableViewCell: UITableViewCell {

    static let reusedID = K.Person.datesReusedId

    let personDatesLabel: UILabel = {
        let label = UILabel()
        label.text = "15 августа 1769 - 5 мая 1821"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Romans", size: 15)
        label.font = .italicSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    func configure(with value: MGallery) {
//        personDatesLabel.text = value.years
//    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(personDatesLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
        
            personDatesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            personDatesLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            personDatesLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            personDatesLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
