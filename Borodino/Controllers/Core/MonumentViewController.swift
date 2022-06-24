//
//  MonumentViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 17.06.2022.
//

import UIKit


class MonumentViewController: UIViewController {
    
    private enum MonumentSection: Int, CaseIterable {
        case monumentsSection = 0
    }
    
    var collectionView: UICollectionView! = nil
    private var dataSource: UICollectionViewDiffableDataSource<MonumentSection, MGallery>?
    var navigationView = UIView()
    
    let monumentsJSONData = Bundle.main.decode([MGallery].self, from: "monuments.json")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createNavigationBar()
        createCollectionView()
        createDataSource()
        reloadData()
        
        collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    private func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<MonumentSection, MGallery>()
        
        snapshot.appendSections([.monumentsSection])
        
        snapshot.appendItems(monumentsJSONData, toSection: .monumentsSection)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
        
    }
    

}

extension MonumentViewController {
    
    private func createNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.prefersLargeTitles = true
        title = "Памятники"
        //navigationController?.hidesBarsOnSwipe = true
    }
    
    
    private func createCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompisitionlLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(MonumentCollectionViewCell.self, forCellWithReuseIdentifier: MonumentCollectionViewCell.resuedId)
    }
    
    
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: MGallery, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.resuedId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        
        cell.configure(with: value)
        
        return cell
    }
    
    private func createDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource<MonumentSection, MGallery>(collectionView: collectionView, cellProvider: { collectionView, indexPath, gallery in
            guard let section = MonumentSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
                
            switch section {
                
            case .monumentsSection:
                return self.configure(cellType: MonumentCollectionViewCell.self, with: gallery, for: indexPath)
            }
        })
        
            
        
    }
    
    private func createCompisitionlLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            guard let section = MonumentSection(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
                
            case .monumentsSection:
                return self.createMonumentSection()
            }
        }
        
        
        
        return layout
            
    }
    
    private func createMonumentSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = 16
        
        let section = NSCollectionLayoutSection(group: group)
        // отступы у секций
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        // отсутпы между группами
        section.interGroupSpacing = 10
        // задать свойство прокручивания в горизонтальной прокрутке
        
        
        return section
    }
    
    
        
}

// MARK: - UICollectionViewDelegate
extension MonumentViewController: UICollectionViewDelegate {

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        guard let monument = self.dataSource?.itemIdentifier(for: indexPath) else { return }
//        let monumentDetailVC = MonumentDetailViewController()
//        present(monumentDetailVC, animated: true, completion: nil)
//    }
}
//
//extension MonumentViewController: MonumentCollectionViewCellDelegate {
//
//    func MonumentCollectionViewCellDidTappedCell(_ cell: MonumentCollectionViewCell, viewModel: MonumentViewModel) {
//
//        let gallery2 = monumentsJSONData[indexPath.row]
//
//        DispatchQueue.main.async { [weak self] in
//            let detailVC = TestMonumentDetailViewController()
//            detailVC.configure(with: MonumentViewModel(image: gallery2, title: gallery2, years: <#T##String?#>, emblem: <#T##String?#>, overview: <#T##String?#>))
//            self?.navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }
//
//
//
//}


//DispatchQueue.main.async { [weak self] in
//    let viewController = PreviewViewController()
//    viewController.configure(with:  viewModel)
//    self?.navigationController?.pushViewController(viewController, animated: true)
//}
