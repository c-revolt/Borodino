//
//  PaintingCollectionViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

class PaintingCollectionViewCell: UICollectionViewCell {
    
    static let identifire = K.SectionTitles.paintings
    
    private let paintingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        paintingImageView.frame = contentView.bounds
    }
    
}

// MARK: - Setup UI Elements
extension PaintingCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(paintingImageView)
    }
    
    
    
}

// MARK: - Configured with SDWebImages
