//
//  PaintingCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

protocol ConfiguringCell {
    static var resuedId: String { get }
    func configure(with value: MGallery)
}

protocol BattleEpisodeCollectionViewCellDelegate: AnyObject {
    
    func battleEpisodeCollectionViewCellDidTappedCell(_ cell: BattleEpisodeCollectionViewCell, viewModel: BattleDetailViewModel)
}

class BattleEpisodeCollectionViewCell: UICollectionViewCell, ConfiguringCell {
    
    static var resuedId = K.paintingIdCell
    
    static let identifire = K.SectionTitles.paintings
    
    weak var delegate: BattleEpisodeCollectionViewCellDelegate?
    
    private let paintingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .brown
        //imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let paintingTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 21)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let readButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow
        button.setTitle("Читать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var battle: MGallery = MGallery()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        
        applyConstraints()
        readButton.addTarget(self, action: #selector(readButtonPressed), for: .touchUpInside)
        
        
        //readButton.addTarget(self, action: #selector(readButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        paintingImageView.frame = contentView.bounds
    }
    
    @objc func readButtonPressed() {
        
        
        let battleDetailVC = BattleDetailViewController()
        //battleDetailVC.battleDetail = battle
        //battleDetailVC.modalTransitionStyle = .coverVertical
        battleDetailVC.modalPresentationStyle = .fullScreen
    
        //navigationController?.present(battleDetailVC.self, animated: true)
        //navigationController?.pushViewController(battleDetailVC, animated: true)
        
    }
    
    func configure(with value: MGallery) {
        paintingImageView.image = UIImage(named: value.image ?? "photo")
        paintingTitleLabel.text = value.title
    }
}

// MARK: - Setup UI Elements
extension BattleEpisodeCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(paintingImageView)
        createGradient()
        addSubview(paintingTitleLabel)
        addSubview(readButton)
        
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            paintingImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            paintingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            paintingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            paintingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            paintingTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            paintingTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            paintingTitleLabel.widthAnchor.constraint(equalToConstant: 250)
        
        ])
        
        NSLayoutConstraint.activate([
            readButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            readButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            readButton.widthAnchor.constraint(equalToConstant: 80),
            readButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

