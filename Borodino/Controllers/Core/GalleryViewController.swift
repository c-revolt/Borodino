//
//  GalleryViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    
    private enum Section: Int, CaseIterable {
        case battleEpisodeCase = 0
        case russianSideCase = 1
        case russianCommandersCase = 2
        case frenchSideCase = 3
        case frenchCommandersCase = 4
        case interestigCase = 5
        
        func description() -> String {
            switch self {
                
            case .battleEpisodeCase:
                return K.Gallery.battleSectionTitle
            case .russianSideCase:
                return K.Gallery.russianSideSectionTitle
            case .russianCommandersCase:
                return K.Gallery.russianCommandersSectionTitle
            case .frenchSideCase:
                return K.Gallery.frenchSideSectionTitle
            case .frenchCommandersCase:
                return K.Gallery.frenchCommandersSectionTitle
            case .interestigCase:
                return K.Gallery.interestingSectionTitle
            }
        }
    }
    
    var collectionView: UICollectionView! = nil
    private var dataSource: UICollectionViewDiffableDataSource<Section, MGallery>?
    var navigationView = UIView()
    var scrollView = UIScrollView()
    
    let battleDataFromJSON = Bundle.main.decode([MGallery].self, from: "battleEpisodes.json")
    let russianSideDataFromJSON = Bundle.main.decode([MGallery].self, from: "russianSideData.json")
    let russianComandersDataFromJSON = Bundle.main.decode([MGallery].self, from: "russianCommandersData.json")
    let frenchSideDataFromJSON = Bundle.main.decode([MGallery].self, from: "frenchSideData.json")
    let frenchComandersDataFromJSON = Bundle.main.decode([MGallery].self, from: "frenchCommandersData.json")
    let interestingDataFromJSON = Bundle.main.decode([MGallery].self, from: "interesting.json")

    var russianPersons: [MGallery] = [MGallery]()
    var frenchPersons: [MGallery] = [MGallery]()
    var battle: [MGallery] = [MGallery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        battle = battleDataFromJSON
        russianPersons = russianComandersDataFromJSON
        frenchPersons = frenchComandersDataFromJSON
        
        createNavigationBar()
        setupCollectionView()
        
        createDataSource()
        reloadData()
        
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
        scrollView.frame = view.bounds
    }
    
    private func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MGallery>()
        
        snapshot.appendSections([.battleEpisodeCase, .russianSideCase, .russianCommandersCase, .frenchSideCase, .frenchCommandersCase, .interestigCase])
        
        snapshot.appendItems(battleDataFromJSON, toSection: .battleEpisodeCase)
        snapshot.appendItems(russianSideDataFromJSON, toSection: .russianSideCase)
        snapshot.appendItems(russianComandersDataFromJSON, toSection: .russianCommandersCase)
        snapshot.appendItems(frenchSideDataFromJSON, toSection: .frenchSideCase)
        snapshot.appendItems(frenchComandersDataFromJSON, toSection: .frenchCommandersCase)
        snapshot.appendItems(interestingDataFromJSON, toSection: .interestigCase)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
        
        
    }
}

//MARK: - Setup UI ELements
extension GalleryViewController {
    
    private func createNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
            navigationBar?.shadowImage = UIImage()
        navigationBar?.backgroundColor = .clear
        
    }    
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reusedId)
        
        collectionView.register(BattleEpisodeCollectionViewCell.self, forCellWithReuseIdentifier: BattleEpisodeCollectionViewCell.resuedId)
        collectionView.register(RussianSideDataCell.self, forCellWithReuseIdentifier: RussianSideDataCell.resuedId)
        collectionView.register(RussianCommandersCollectionViewCell.self, forCellWithReuseIdentifier: RussianCommandersCollectionViewCell.resuedId)
        collectionView.register(FrenchSideDataCell.self, forCellWithReuseIdentifier: FrenchSideDataCell.resuedId)
        collectionView.register(FrenchCommandersCollectionViewCell.self, forCellWithReuseIdentifier: FrenchCommandersCollectionViewCell.resuedId)
        collectionView.register(InterestingCollectionViewCell.self, forCellWithReuseIdentifier: InterestingCollectionViewCell.resuedId)
    
    }
    
}

// MARK: - Data Source
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
                
            case .battleEpisodeCase:
                
                return self.configure(cellType: BattleEpisodeCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .russianSideCase:
                
                return self.configure(cellType: RussianSideDataCell.self, with: gallery, for: indexPath)
                
            case .russianCommandersCase:
                return self.configure(cellType: RussianCommandersCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .frenchSideCase:
                return self.configure(cellType: FrenchSideDataCell.self, with: gallery, for: indexPath)
                
            case .frenchCommandersCase:
                
                return self.configure(cellType: FrenchCommandersCollectionViewCell.self, with: gallery, for: indexPath)
                
            case .interestigCase:
                return self.configure(cellType: InterestingCollectionViewCell.self, with: gallery, for: indexPath)
            }
        })
    
        // создание Хэдера Секций
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reusedId, for: indexPath) as? SectionHeader else { fatalError("🟥 Can not create new section header!") }
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("🔴 Unknown section kind") }
                    
            sectionHeader.configurate(text: section.description(), font: UIFont(name: "Times New Roman", size: 18), textColor: .white)
            
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
            case .battleEpisodeCase:
                return self.createBattleEpisodeSection()
            case .russianSideCase:
                return self.createBattleData()
            case .russianCommandersCase:
                return self.createPersonsSection()
            case .frenchSideCase:
                return self.createBattleData()
            case .frenchCommandersCase:
                return self.createPersonsSection()
            case .interestigCase:
                return self.createInterestingSection()
            }
            
        }
        
        // расстояние хедера
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createBattleEpisodeSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        section.interGroupSpacing = 5
        // задать свойство прокручивания в горизонтальной прокрутке
        section.orthogonalScrollingBehavior = .continuous
        
        return section
        
    }
    
    private func createPersonsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 7
        // размеры отсутпов по бокам
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 10, bottom: 0, trailing: 0)
        
        // header
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createBattleData() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 10
        item.contentInsets.bottom = 10
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 10, bottom: 0, trailing: 10)
        // отсутпы между группами
        section.interGroupSpacing = 2
        // задать свойство прокручивания в горизонтальной прокрутке
        section.orthogonalScrollingBehavior = .groupPaging
        
        // header
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createInterestingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(190))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        // размеры отсутпов по бокам
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 0, bottom: 100, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
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

// MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

        guard let section = Section(rawValue: indexPath.section) else { return }
        
        switch section {
            
        case .battleEpisodeCase:
            
            let battleArray = battle[indexPath.row]
            let battleDetailVC = BattleDetailViewController()
            battleDetailVC.battleDetail = battleArray
            battleDetailVC.modalPresentationStyle = .fullScreen
            
            navigationController?.pushViewController(battleDetailVC, animated: true)
            
        case .russianSideCase:
            print("123")
            
        case .russianCommandersCase:
            let russianPersonArray = russianPersons[indexPath.row]

            let personDetailVC = PersonDetailViewController()
            personDetailVC.personsDetail = russianPersonArray
            personDetailVC.modalTransitionStyle = .coverVertical
            
            navigationController?.present(personDetailVC.self, animated: true)

            
        case .frenchSideCase:
            print("123")
            
        case .frenchCommandersCase:
            let frenchPersonArray = frenchPersons[indexPath.row]
            
            let personDetailVC = PersonDetailViewController()
            personDetailVC.personsDetail = frenchPersonArray
            personDetailVC.modalTransitionStyle = .coverVertical
            

            navigationController?.present(personDetailVC.self, animated: true)
            
        case .interestigCase:
            print("123")
        }
    }
    

}

