//
//  MonumentDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 20.06.2022.
//

import UIKit


class MonumentDetailViewController: UIViewController {
    
    private enum MonumentDetailSection: Int, CaseIterable {
        
        case monumentImage = 0
        case monumentTitle = 1
        case monumentAddress = 2
        case source = 3
        case monumentOverview = 4
        case monumentMap = 5
    }
    
    var collectionView: UICollectionView! = nil
    private var dataSource: UICollectionViewDiffableDataSource<MonumentDetailSection, MGallery>?
    let monumentsJSONData = Bundle.main.decode([MGallery].self, from: "monuments.json")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //collectionView.contentInsetAdjustmentBehavior = .never
        
        

    }
    
    
    private func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<MonumentDetailSection, MGallery>()
        
        snapshot.appendSections([.monumentImage, .monumentTitle, .monumentAddress, .source, .monumentOverview, .monumentMap])
        snapshot.appendItems(monumentsJSONData, toSection: .monumentImage)
        snapshot.appendItems(monumentsJSONData, toSection: .monumentTitle)
        snapshot.appendItems(monumentsJSONData, toSection: .monumentAddress)
        snapshot.appendItems(monumentsJSONData, toSection: .source)
        snapshot.appendItems(monumentsJSONData, toSection: .monumentOverview)
        snapshot.appendItems(monumentsJSONData, toSection: .monumentMap)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
        
    }

    

}

extension MonumentDetailViewController {
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompisitionlLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.backgroundColor = .blue
        
        collectionView.register(ImageMonumentDetailCollectionViewCell.self, forCellWithReuseIdentifier: ImageMonumentDetailCollectionViewCell.resuedId)
        collectionView.register(TitleMonumentDetailCollectionViewCell.self, forCellWithReuseIdentifier: TitleMonumentDetailCollectionViewCell.resuedId)
        collectionView.register(AddressMonumentDetailCollectionViewCell.self, forCellWithReuseIdentifier: AddressMonumentDetailCollectionViewCell.resuedId)
        collectionView.register(SourceMonumetDetailCollectionViewCell.self, forCellWithReuseIdentifier: SourceMonumetDetailCollectionViewCell.resuedId)
        collectionView.register(OverviewMonumentDetailCollectionViewCell.self, forCellWithReuseIdentifier: OverviewMonumentDetailCollectionViewCell.resuedId)
        collectionView.register(MapMonumentDetailCollectionViewCell.self, forCellWithReuseIdentifier: MapMonumentDetailCollectionViewCell.resuedId)
        
    }
    
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: MGallery, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.resuedId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        
        cell.configure(with: value)
        
        return cell
    }
    
   
    private func createDataSource() {

        dataSource = UICollectionViewDiffableDataSource<MonumentDetailSection, MGallery>(collectionView: collectionView, cellProvider: { collectionView, indexPath, gallery in

            guard let section = MonumentDetailSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .monumentImage:
                return self.configure(cellType: ImageMonumentDetailCollectionViewCell.self, with: gallery, for: indexPath)
            case .monumentTitle:
                return self.configure(cellType: TitleMonumentDetailCollectionViewCell.self, with: gallery, for: indexPath)
            case .monumentAddress:
                return self.configure(cellType: AddressMonumentDetailCollectionViewCell.self, with: gallery, for: indexPath)
            case .source:
                return self.configure(cellType: SourceMonumetDetailCollectionViewCell.self, with: gallery, for: indexPath)
            case .monumentOverview:
                return self.configure(cellType: OverviewMonumentDetailCollectionViewCell.self, with: gallery, for: indexPath)
            case .monumentMap:
                return self.configure(cellType: MapMonumentDetailCollectionViewCell.self, with: gallery, for: indexPath)
            }
            


        })
    }
    
    
    private func createCompisitionlLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            guard let section = MonumentDetailSection(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .monumentImage:
                return self.createMonumentImageSection()
            case .monumentTitle:
                return self.createMonumentTitleSection()
            case .monumentAddress:
                return self.createMonumentAddressSection()
            case .source:
                return self.createSourceSection()
            case .monumentOverview:
                return self.createMonumentOverviewSection()
            case .monumentMap:
                return self.createMonumentMapSection()
            }
        }
        return layout
    }
}

// MARK: - Create Sections for Controller
extension MonumentDetailViewController {
    
    private func createMonumentImageSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        
        
        
        return section
    }
    
    private func createMonumentTitleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        
        
        
        return section
    }
    
    private func createMonumentAddressSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        
        return section
    }
    
    private func createSourceSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        
        return section
    }
    
    private func createMonumentOverviewSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        return section
    }
    
    private func createMonumentMapSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        //section.interGroupSpacing = 10
        return section
    }
    
    
}
