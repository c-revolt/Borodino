//
//  TestHomeController.swift
//  Borodino
//
//  Created by Александр Прайд on 10.06.2022.
//

import UIKit

class TestHomeController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case paintings = 0
        case persons = 1
        case monuments = 2
        case places = 3
        case interesting = 4
    }
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, MGallery>?
    
    let paintings = Bundle.main.decode([MGallery].self, from: "paintings.json")
    let persons = Bundle.main.decode([MGallery].self, from: "persons.json")
    let monuments = Bundle.main.decode([MGallery].self, from: "monuments.json")
    let places = Bundle.main.decode([MGallery].self, from: "places.json")
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
        
        snapshot.appendSections([.paintings, .persons, .monuments, .places, .interesting])
        
        snapshot.appendItems(paintings, toSection: .paintings)
        snapshot.appendItems(persons, toSection: .persons)
        snapshot.appendItems(monuments, toSection: .monuments)
        snapshot.appendItems(places, toSection: .places)
        snapshot.appendItems(interesting, toSection: .interesting)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
        
        
    }
    
    
}

//MARK: - Setup UI ELements
extension TestHomeController {
    
    private func addSubviews() {
        
    }
    
    private func createNavigationBar() {
        let navigationBarApperance = UINavigationBar.appearance()
        navigationBarApperance.backgroundColor = .yellow

    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_2")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_3")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_4")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell_5")
    }
    
}

// MARK: Data Source
extension TestHomeController {
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MGallery>(collectionView: collectionView, cellProvider: { collectionView, indexPath, gallery in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
                
            case .paintings:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_", for: indexPath)
                cell.backgroundColor = .blue
                
                return cell
                
            case .monuments:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_2", for: indexPath)
                cell.backgroundColor = .black
                
                return cell
                
            case .persons:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_3", for: indexPath)
                cell.backgroundColor = .yellow
                
                return cell
                
            case .places:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_4", for: indexPath)
                cell.backgroundColor = .green
                
                return cell
                
            case .interesting:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_5", for: indexPath)
                cell.backgroundColor = .orange
                
                return cell
            }
        })
    }
}

// MARK: - Setup Layout
extension TestHomeController {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .paintings:
                return self.createPaintingsSection()
            case .persons:
                return self.createPersonsSection()
            case .monuments:
                return self.createPaintingsSection()
            case .places:
                return self.createPaintingsSection()
            case .interesting:
                return self.createPersonsSection()
            }
            
        }
        
        return layout
    }
    
    private func createPaintingsSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(150))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 5, bottom: 0, trailing: 5)
        // отсутпы между группами
        section.interGroupSpacing = 5
        // задать свойство прокручивания в горизонтальной прокрутке
        section.orthogonalScrollingBehavior = .continuous
        
        
        return section
        
    }
    
    private func createPersonsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        // размеры отсутпов по бокам
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 5, bottom: 0, trailing: 5)
        
        return section
    }
    
}




