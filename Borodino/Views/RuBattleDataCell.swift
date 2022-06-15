//
//  RuBattleDataCell.swift
//  Borodino
//
//  Created by Александр Прайд on 14.06.2022.
//

import UIKit

class RuBattleDataCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.ruBattleIIDCell

    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 13)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .russianGreen()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ruIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        applyConstraints()
        
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.cornerRadius = 7
        layer.borderWidth = 1
        layer.borderColor = UIColor.russianGreen().cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with value: MGallery) {
        ruIcon.image = UIImage(named: value.image ?? "photo")
        title.text = value.title
        countTitleLabel.text = value.overview
    }
    
}
// MARK: - Setup UI Elements
extension RuBattleDataCell {
    
    private func addSubviews() {
        addSubview(ruIcon)
        addSubview(title)
        addSubview(countTitleLabel)
        
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            ruIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            ruIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ruIcon.heightAnchor.constraint(equalToConstant: 25),
            ruIcon.widthAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: ruIcon.bottomAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2)
            
            
        ])
        
        NSLayoutConstraint.activate([
            countTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            countTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
}
