//
//  TableMonumentViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 22.06.2022.
//

import UIKit

class TableMonumentViewCell: UITableViewCell {

    static var resuedId = K.monumentCollectionViewIDCell
    
    private let monumentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "46m")
        //imageView.layer.borderWidth = 1
        //imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let monumentTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.textAlignment = .left
//        label.font = UIFont(name: "Avenir", size: 16)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
