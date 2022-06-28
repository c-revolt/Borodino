//
//  PersonDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 16.06.2022.
//

import UIKit

class BattleDetailViewController: UIViewController {

    
    private var battleTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(BattleImageTableViewCell.self, forCellReuseIdentifier: BattleImageTableViewCell.reusedID)
        table.register(BattleTitleTableViewCell.self, forCellReuseIdentifier: BattleTitleTableViewCell.reusedId)
        table.register(BattleOverviewTableViewCell.self, forCellReuseIdentifier: BattleOverviewTableViewCell.reusedId)
        table.register(BattlePlacemarkTableViewCell.self, forCellReuseIdentifier: BattlePlacemarkTableViewCell.reusedId)
        table.register(BattleMapTableViewCell.self, forCellReuseIdentifier: BattleMapTableViewCell.reusedId)
        
        return table
    }()
    
    let battleEpisodeJSONData = Bundle.main.decode([MBattle].self, from: "paintings.json")
    var battleDetail: MGallery = MGallery()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(battleTableView)
        
        battleTableView.delegate = self
        battleTableView.dataSource = self
        
        battleTableView.contentInsetAdjustmentBehavior = .never
        
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        battleTableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // скрываем статус бар при скролле
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.hidesBarsOnSwipe = false
        
    }
    

    

}

// MARK: -
extension BattleDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            guard let cell = battleTableView.dequeueReusableCell(withIdentifier: BattleImageTableViewCell.reusedID, for: indexPath) as? BattleImageTableViewCell else {
                return UITableViewCell()
            }
            
            cell.battleImageView.image = UIImage(named: battleDetail.image ?? "photo")
            return cell
            
        case 1:
            guard let cell = battleTableView.dequeueReusableCell(withIdentifier: BattleTitleTableViewCell.reusedId, for: indexPath) as? BattleTitleTableViewCell else {
                return UITableViewCell()
            }
            cell.battleTitleLabel.text = self.battleDetail.title
            
            return cell
        case 2:
            
            guard let cell = battleTableView.dequeueReusableCell(withIdentifier: BattleOverviewTableViewCell.reusedId, for: indexPath) as? BattleOverviewTableViewCell else {
                return UITableViewCell()
            }
            cell.battleOverviewLabel.text = battleDetail.overview
            return cell
        case 3:
            
            guard let cell = battleTableView.dequeueReusableCell(withIdentifier: BattlePlacemarkTableViewCell.reusedId, for: indexPath) as? BattlePlacemarkTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        case 4:
            guard let cell = battleTableView.dequeueReusableCell(withIdentifier: BattleMapTableViewCell.reusedId, for: indexPath) as? BattleMapTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        guard let section = BattleSection(rawValue: indexPath.row) else {
//            fatalError("Unknown section kind")
//        }
        
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return UITableView.automaticDimension
        case 2:
            return UITableView.automaticDimension
        case 3:
            return 40
        case 4:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }
    
    
}


