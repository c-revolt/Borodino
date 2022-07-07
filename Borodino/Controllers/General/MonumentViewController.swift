//
//  TableMonumentViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 22.06.2022.
//

import UIKit

class MonumentViewController: UIViewController {

    var monumentDetail: MMonument = MMonument()
    
    
    private let monumentTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        table.register(MonumentImagelTableViewCell.self, forCellReuseIdentifier: MonumentImagelTableViewCell.reusedId)
        table.register(MonumentTitleTableViewCell.self, forCellReuseIdentifier: MonumentTitleTableViewCell.reusedId)
        table.register(MonumentSourceTableViewCell.self, forCellReuseIdentifier: MonumentSourceTableViewCell.reusedID)
        table.register(MonumentAddressTableViewCell.self, forCellReuseIdentifier: MonumentAddressTableViewCell.reusedID)
        table.register(MonumentHeaderTableViewCell.self, forCellReuseIdentifier: MonumentHeaderTableViewCell.reusedID)
        table.register(MonumentOverviewTableViewCell.self, forCellReuseIdentifier: MonumentOverviewTableViewCell.reusedID)
        table.register(MonumentBottomHeaderTableViewCell.self, forCellReuseIdentifier: MonumentBottomHeaderTableViewCell.reusedId)
        table.register(MonumentMapTableViewCell.self, forCellReuseIdentifier: MonumentMapTableViewCell.reusedId)
        
        
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        view.addSubview(monumentTableView)
        monumentTableView.delegate = self
        monumentTableView.dataSource = self
        view.backgroundColor = .systemBackground
        
        monumentTableView.contentInsetAdjustmentBehavior = .never
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        monumentTableView.frame = view.bounds
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

extension MonumentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentImagelTableViewCell.reusedId, for: indexPath) as? MonumentImagelTableViewCell else {
                return UITableViewCell()
            }
            
        
            cell.imageMonumentImageView.image = UIImage(named: monumentDetail.image ?? "photo")
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentTitleTableViewCell.reusedId, for: indexPath) as? MonumentTitleTableViewCell else {
                return UITableViewCell()
            }
            
        
            cell.mainTitleLabel.text = monumentDetail.title
            cell.selectionStyle = .none
            
            return cell
        
        case 2:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentSourceTableViewCell.reusedID, for: indexPath) as? MonumentSourceTableViewCell else {
                return UITableViewCell()
            }
            
            cell.sourceLabel.text = monumentDetail.source
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentAddressTableViewCell.reusedID, for: indexPath) as? MonumentAddressTableViewCell else {
                return UITableViewCell()
            }
            
            cell.addressLabel.text = monumentDetail.address
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentHeaderTableViewCell.reusedID, for: indexPath) as? MonumentHeaderTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            
            return cell
            
            
        
        case 5:
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentOverviewTableViewCell.reusedID, for: indexPath) as? MonumentOverviewTableViewCell else {
                return UITableViewCell()
            }
            
            cell.overviewLabel.text = monumentDetail.overview
            cell.selectionStyle = .none
            
            return cell
            
        case 6:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentBottomHeaderTableViewCell.reusedId, for: indexPath) as? MonumentBottomHeaderTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            
            return cell
            
        case 7:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MonumentMapTableViewCell.reusedId, for: indexPath) as? MonumentMapTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(location: monumentDetail.address ?? "")
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
            return 40
        case 3:
            return 40
        case 4:
            return 40
        case 5:
            return UITableView.automaticDimension
        case 6:
            return 40
        case 7:
            return 350
        default:
            return UITableView.automaticDimension
        }
        
    }
    
    
    
}

