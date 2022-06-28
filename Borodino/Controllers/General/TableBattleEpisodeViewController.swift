//
//  TableBattleEpisodeViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 27.06.2022.
//

import UIKit

class TableBattleEpisodeViewController: UIViewController {

    let battleEpisode: MBattle = MBattle()
    
    private let battleEpisodeTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(BattleImageTableViewCell.self, forCellReuseIdentifier: BattleImageTableViewCell.reusedID)
        table.register(BattleTitleTableViewCell.self, forCellReuseIdentifier: BattleTitleTableViewCell.reusedId)
        table.register(BattleOverviewTableViewCell.self, forCellReuseIdentifier: BattleOverviewTableViewCell.reusedId)
        table.register(BattlePlacemarkTableViewCell.self, forCellReuseIdentifier: BattlePlacemarkTableViewCell.reusedId)
        table.register(BattleMapTableViewCell.self, forCellReuseIdentifier: BattleMapTableViewCell.reusedId)
        
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(battleEpisodeTableView)
        battleEpisodeTableView.delegate = self
        battleEpisodeTableView.dataSource = self
        setupNavigationBar()
        battleEpisodeTableView.contentInsetAdjustmentBehavior = .never
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        battleEpisodeTableView.frame = view.bounds
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

extension TableBattleEpisodeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = battleEpisodeTableView.dequeueReusableCell(withIdentifier: BattleImageTableViewCell.reusedID, for: indexPath) as? BattleImageTableViewCell else {
                return UITableViewCell()
            }
    
            //cell.battleImageView.image = UIImage(named: battleEpisode.image ?? "photo")
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = battleEpisodeTableView.dequeueReusableCell(withIdentifier: BattleTitleTableViewCell.reusedId, for: indexPath) as? BattleTitleTableViewCell else {
                return UITableViewCell()
            }
    
            //cell.battleTitleLabel.text = battleEpisode.title
            cell.selectionStyle = .none
            return cell
            
        case 2:
            guard let cell = battleEpisodeTableView.dequeueReusableCell(withIdentifier: BattleOverviewTableViewCell.reusedId, for: indexPath) as? BattleOverviewTableViewCell else {
                return UITableViewCell()
            }
    
            //cell.battleOverviewLabel.text = battleEpisode.overview
            cell.selectionStyle = .none
            return cell
            
        case 3:
            guard let cell = battleEpisodeTableView.dequeueReusableCell(withIdentifier: BattlePlacemarkTableViewCell.reusedId, for: indexPath) as? BattlePlacemarkTableViewCell else {
                return UITableViewCell()
            }
    
            cell.selectionStyle = .none
            return cell
            
        case 4:
            guard let cell = battleEpisodeTableView.dequeueReusableCell(withIdentifier: BattleMapTableViewCell.reusedId, for: indexPath) as? BattleMapTableViewCell else {
                return UITableViewCell()
            }
    
            cell.selectionStyle = .none
            return cell
            
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
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
