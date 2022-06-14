//
//  GalleryViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case paintings = 0
        case f_persons = 1
        case frBattleData = 2
        case ru_persons = 3
        case ruBattleData = 4
        
        func description() -> String {
            switch self {
                
            case .paintings:
                return "Хронология Битвы"
            case .f_persons:
                return "Французские командующие"
            case .frBattleData:
                return "Французская сторона"
            case .ru_persons:
                return "Российские командующие"
            case .ruBattleData:
                return "Российская сторона"

            }
        }
    }
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, MGallery>?
    
    let paintings = Bundle.main.decode([MGallery].self, from: "paintings.json")
    let fPersons = Bundle.main.decode([MGallery].self, from: "f_persons.json")
    let frBattle = Bundle.main.decode([MGallery].self, from: "fr_battleData.json")
    let ruPersons = Bundle.main.decode([MGallery].self, from: "ru_persons.json")
    let ruBattle = Bundle.main.decode([MGallery].self, from: "ru_battleData.json")
    let interesting = Bundle.main.decode([MGallery].self, from: "interesting.json")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavigationBar()
        
        addSubviews()
        setupCollectionView()
        
        createDataSource()
        reloadData()
    }
    
    private func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MGallery>()
        
        snapshot.appendSections([.paintings, .f_persons, .frBattleData, .ru_persons, .ruBattleData])
        
        snapshot.appendItems(paintings, toSection: .paintings)
        snapshot.appendItems(fPersons, toSection: .f_persons)
        snapshot.appendItems(frBattle, toSection: .frBattleData)
        snapshot.appendItems(ruPersons, toSection: .ru_persons)
        snapshot.appendItems(ruBattle, toSection: .ruBattleData)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
        
        
    }
}

//MARK: - Setup UI ELements
extension GalleryViewController {
    
    private func addSubviews() {
        
    }
    
    private func createNavigationBar() {
        let navigationBarApperance = UINavigationBar.appearance()
        navigationBarApperance.backgroundColor = .systemBackground

    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reusedId)
        
        collectionView.register(PaintingCollectionViewCell.self, forCellWithReuseIdentifier: PaintingCollectionViewCell.resuedId)
        collectionView.register(FrPersonCollectionViewCell.self, forCellWithReuseIdentifier: FrPersonCollectionViewCell.resuedId)
        collectionView.register(FrBattleDataCell.self, forCellWithReuseIdentifier: FrBattleDataCell.resuedId)
        collectionView.register(RuPersonCollectionViewCell.self, forCellWithReuseIdentifier: RuPersonCollectionViewCell.resuedId)
        collectionView.register(RuBattleDataCell.self, forCellWithReuseIdentifier: RuBattleDataCell.resuedId)
    
    }
    
}

// MARK: Data Source
extension GalleryViewController {
    
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: MGallery, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.resuedId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        
        cell.configure(with: value)
        
        return cell
    }
    
    
    
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MGallery>(collectionView: collectionView, cellProvider: { collectionView, indexPath, gallery in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
        
            
            switch section {
                
            case .paintings:
                return self.configure(cellType: PaintingCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .f_persons:
                return self.configure(cellType: FrPersonCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .ru_persons:
                return self.configure(cellType: RuPersonCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .frBattleData:
                return self.configure(cellType: FrBattleDataCell.self, with: gallery, for: indexPath)
                
            case .ruBattleData:
                return self.configure(cellType: RuBattleDataCell.self, with: gallery, for: indexPath)
                
            }
        })
    
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reusedId, for: indexPath) as? SectionHeader else { fatalError("🟥 Can not create new section header!") }
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("🔴 Unknown section kind") }
                    
            sectionHeader.configurate(text: section.description(), font: UIFont(name: "Avenir", size: 18), textColor: .link)
            
            return sectionHeader
        }
    }
    
}

// MARK: - Setup Layout
extension GalleryViewController {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .paintings:
                return self.createPaintingsSection()
            case .f_persons:
                return self.createPersonsSection()
            case .ru_persons:
                return self.createPersonsSection()
            case .frBattleData:
                return self.createBattleData()
            case .ruBattleData:
                return self.createBattleData()
            
            }
            
        }
        
        // расстояние хедера
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createPaintingsSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 5, bottom: 0, trailing: 5)
        // отсутпы между группами
        section.interGroupSpacing = 5
        // задать свойство прокручивания в горизонтальной прокрутке
        section.orthogonalScrollingBehavior = .continuous
        
        // header
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
        
    }
    
    private func createPersonsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        // размеры отсутпов по бокам
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 5, bottom: 0, trailing: 5)
        
        // header
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createBattleData() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 5, bottom: 0, trailing: 5)
        // отсутпы между группами
        section.interGroupSpacing = 5
        // задать свойство прокручивания в горизонтальной прокрутке
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        return section
    }
    
    private func createPanoramaSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        // размеры отсутпов по бокам
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 5, bottom: 0, trailing: 5)
        
        // header
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        // настройка хэдэра
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(1))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        return sectionHeader
    }
    
}




