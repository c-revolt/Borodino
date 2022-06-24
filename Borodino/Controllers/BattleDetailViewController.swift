//
//  PersonDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 16.06.2022.
//

import UIKit

class BattleDetailViewController: UIViewController {

    enum Section: Int, CaseIterable {
        
        case imageBattle = 0
        case titleBttle = 1
        case overviewBattle = 2
    
    }
    
    let tableView: UITableView! = nil
    let battleEpisodeJSONData = Bundle.main.decode([MGallery].self, from: "paintings.json")
    var dataSource: UITableViewDiffableDataSource<Section, MGallery>?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        setupTableView()
        createDataSource()
        reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
//    func configure(with model: BattleDetailViewModel) {
//            titleLabel.text = model.title
//            overviewLabel.text = model.titleOverview
//            voteAverageLabel.text = String(model.voteAverage)
//    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MGallery>()
        
        snapshot.appendSections([.imageBattle, .titleBttle, .overviewBattle])
        
        snapshot.appendItems(battleEpisodeJSONData, toSection: .imageBattle)
        snapshot.appendItems(battleEpisodeJSONData, toSection: .titleBttle)
        snapshot.appendItems(battleEpisodeJSONData, toSection: .overviewBattle)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }

}

// MARK: -
extension BattleDetailViewController {
    
    private func setupTableView() {
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
    }
    
    // DATA SOURCE
    private func configure<T: ConfiguringCell>(cellType: T.Type, with value: MGallery, for indexPath: IndexPath) -> T {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.resuedId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        
        cell.configure(with: value)
        
        return cell
    }
    
    private func createDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, MGallery>(tableView: tableView, cellProvider: { tableView, indexPath, gallery in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .imageBattle:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
                
            case .titleBttle:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
                cell.backgroundColor = .white
                return cell
            case .overviewBattle:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
                cell.backgroundColor = .yellow
                return cell
            }
            
            
        })
           
    }
}
