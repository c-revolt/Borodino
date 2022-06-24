//
//  CustumHeader.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class CustumHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "CustomHeader"
    
    let image = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configuringContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuringContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
