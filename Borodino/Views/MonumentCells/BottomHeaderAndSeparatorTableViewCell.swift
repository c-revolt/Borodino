//
//  BottomHeaderAndSeparatorTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class BottomHeaderAndSeparatorTableViewCell: UITableViewCell {

    
    static let reusedId = "BottomHeaderAndSeparatorTableViewCell"
    
    private let overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ГДЕ НАХОДИТСЯ"
        label.textColor = .white
        label.textAlignment = .justified
//        label.font = UIFont(name: "Times New Romans", size: 20)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .darkGray
        contentView.addSubview(overviewTitleLabel)
        contentView.addSubview(separatorView)
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
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
    }

}
