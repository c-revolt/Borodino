//
//  TableMonumentViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 22.06.2022.
//

import UIKit

class TableMonumentViewController: UIViewController {

    var monumentDetail: MMonument = MMonument()
    
    
    private let monumentTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        
        //table.register(CustumHeader.self, forHeaderFooterViewReuseIdentifier: CustumHeader.reuseIdentifier)
        table.register(ImageMonumentDetailTableViewCell.self, forCellReuseIdentifier: ImageMonumentDetailTableViewCell.reusedIdentifire)
        table.register(TitleMonumentDetailTableViewCell.self, forCellReuseIdentifier: TitleMonumentDetailTableViewCell.reusedIdetntifire)
        table.register(SourceMonumentTableViewCell.self, forCellReuseIdentifier: SourceMonumentTableViewCell.reusedIdentifire)
        table.register(AddressMonumentDetailTableViewCell.self, forCellReuseIdentifier: AddressMonumentDetailTableViewCell.reeusedIdentifire)
        table.register(HeaderOverviewTableViewCell.self, forCellReuseIdentifier: HeaderOverviewTableViewCell.reusedIdentifire)
        table.register(OverviewMonumentDetailTableViewCell.self, forCellReuseIdentifier: OverviewMonumentDetailTableViewCell.resuedIdentifire)
        table.register(BottomHeaderAndSeparatorTableViewCell.self, forCellReuseIdentifier: BottomHeaderAndSeparatorTableViewCell.reusedId)
        table.register(MapMonumentDetailTableViewCell.self, forCellReuseIdentifier: MapMonumentDetailTableViewCell.reusedId)
        
        
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

extension TableMonumentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: ImageMonumentDetailTableViewCell.reusedIdentifire, for: indexPath) as? ImageMonumentDetailTableViewCell else {
                return UITableViewCell()
            }
            
        
            cell.imageMonumentImageView.image = UIImage(named: monumentDetail.image ?? "photo")
            cell.selectionStyle = .none
            return cell
            
        case 1:
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: TitleMonumentDetailTableViewCell.reusedIdetntifire, for: indexPath) as? TitleMonumentDetailTableViewCell else {
                return UITableViewCell()
            }
            
        
            cell.mainTitleLabel.text = monumentDetail.title
            cell.selectionStyle = .none
            return cell
        
        case 2:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: SourceMonumentTableViewCell.reusedIdentifire, for: indexPath) as? SourceMonumentTableViewCell else {
                return UITableViewCell()
            }
            
            cell.sourceLabel.text = monumentDetail.source
            cell.selectionStyle = .none
            return cell
            
        case 3:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: AddressMonumentDetailTableViewCell.reeusedIdentifire, for: indexPath) as? AddressMonumentDetailTableViewCell else {
                return UITableViewCell()
            }
            
            cell.addressLabel.text = monumentDetail.address
            cell.selectionStyle = .none
            return cell
            
        case 4:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: HeaderOverviewTableViewCell.reusedIdentifire, for: indexPath) as? HeaderOverviewTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            return cell
            
            
        
        case 5:
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: OverviewMonumentDetailTableViewCell.resuedIdentifire, for: indexPath) as? OverviewMonumentDetailTableViewCell else {
                return UITableViewCell()
            }
            
            cell.overviewLabel.text = monumentDetail.overview
            cell.selectionStyle = .none
            return cell
            
        case 6:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: BottomHeaderAndSeparatorTableViewCell.reusedId, for: indexPath) as? BottomHeaderAndSeparatorTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            return cell
            
        case 7:
            
            guard let cell = monumentTableView.dequeueReusableCell(withIdentifier: MapMonumentDetailTableViewCell.reusedId, for: indexPath) as? MapMonumentDetailTableViewCell else {
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

