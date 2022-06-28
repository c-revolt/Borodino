//
//  PlacesDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 28.06.2022.
//

import UIKit

class PlacesDetailViewController: UIViewController {

    var placeDetail: MMonument = MMonument()
    
    
    private let placeTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        
        
        table.register(PlaceImageTableViewCell.self, forCellReuseIdentifier: PlaceImageTableViewCell.reusedId)
        table.register(PlaceTitleTableViewCell.self, forCellReuseIdentifier: PlaceTitleTableViewCell.reusedId)
        table.register(PlaceAddressTableViewCell.self, forCellReuseIdentifier: PlaceAddressTableViewCell.reusedId)
        table.register(PlaceHeaderTableViewCell.self, forCellReuseIdentifier: PlaceHeaderTableViewCell.reusedId)
        table.register(PlaceOverviewTableViewCell.self, forCellReuseIdentifier: PlaceOverviewTableViewCell.reusedId)
        table.register(PlaceBottomHeaderTableViewCell.self, forCellReuseIdentifier: PlaceBottomHeaderTableViewCell.reusedId)
        table.register(PlaceMapTableViewCell.self, forCellReuseIdentifier: PlaceMapTableViewCell.reusedId)
        
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(placeTableView)
        placeTableView.delegate = self
        placeTableView.dataSource = self
        placeTableView.contentInsetAdjustmentBehavior = .never
        setupNavigationBar()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeTableView.frame = view.bounds
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

// MARK: - UITableViewDelegate & UITableViewDataSource
extension PlacesDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceImageTableViewCell.reusedId, for: indexPath) as? PlaceImageTableViewCell else {
                return UITableViewCell()
            }
            cell.placeImageView.image = UIImage(named: placeDetail.image ?? "photo")
            cell.selectionStyle = .none
            return cell
            
        case 1:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceTitleTableViewCell.reusedId, for: indexPath) as? PlaceTitleTableViewCell else {
                return UITableViewCell()
            }
            cell.mainTitleLabel.text = placeDetail.title
            return cell
            
        case 2:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceAddressTableViewCell.reusedId, for: indexPath) as? PlaceAddressTableViewCell else {
                return UITableViewCell()
            }
            cell.addressLabel.text = placeDetail.address
            return cell
            
        case 3:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceHeaderTableViewCell.reusedId, for: indexPath) as? PlaceHeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case 4:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceOverviewTableViewCell.reusedId, for: indexPath) as? PlaceOverviewTableViewCell else {
                return UITableViewCell()
            }
            cell.overviewLabel.text = placeDetail.overview
            return cell
            
        case 5:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceBottomHeaderTableViewCell.reusedId, for: indexPath) as? PlaceBottomHeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case 6:
            guard let cell = placeTableView.dequeueReusableCell(withIdentifier: PlaceMapTableViewCell.reusedId, for: indexPath) as? PlaceMapTableViewCell else {
                return UITableViewCell()
            }
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
            return UITableView.automaticDimension
        case 5:
            return 40
        case 6:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }
    
}
