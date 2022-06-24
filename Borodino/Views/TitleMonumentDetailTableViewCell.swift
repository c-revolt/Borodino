//
//  TitleMonumentDetailTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class TitleMonumentDetailTableViewCell: UITableViewCell {

    static let reusedIdetntifire = "TitleMonumentDetailTableViewCell"
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Место командного пункта Наполеона. Памятник «Мертвым Великой армии»"
        label.textColor = .white
        label.textAlignment = .left
        //label.font = UIFont(name: "Times New Romans", size: 22)
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
//    func confugure(whith model: MonumentViewModel) {
//        mainTitleLabel.text = model.title
//    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainTitleLabel)
        applyConstraints()
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            mainTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            mainTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
       
    }
}


