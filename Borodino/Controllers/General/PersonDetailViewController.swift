//
//  PersonDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonDetailViewController: UIViewController {

    var personsDetail: MGallery = MGallery()
    
    private var personTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.register(PersonPortraitTableViewCell.self, forCellReuseIdentifier: PersonPortraitTableViewCell.reusedID)
        table.register(PersonNameTableViewCell.self, forCellReuseIdentifier: PersonNameTableViewCell.reusedID)
        table.register(PersonRoleTableViewCell.self, forCellReuseIdentifier: PersonRoleTableViewCell.reusedID)
        table.register(PersonDatesTableViewCell.self, forCellReuseIdentifier: PersonDatesTableViewCell.reusedID)
        table.register(PersonEmblemTableViewCell.self, forCellReuseIdentifier: PersonEmblemTableViewCell.reusedID)
        table.register(PersonOverviewTableViewCell.self, forCellReuseIdentifier: PersonOverviewTableViewCell.reusedID)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(personTableView)
        setupNavigationBar()
        personTableView.delegate = self
        personTableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        personTableView.frame = view.bounds
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

}

// MARK: - Setup UI Elements
extension PersonDetailViewController {
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.hidesBarsOnSwipe = false
        
    }
}

// MARK: - Setup UITableViewDelegate & UITableViewDataSource
extension PersonDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.portraitReusedId, for: indexPath) as? PersonPortraitTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.portraitImageView.image = UIImage(named: personsDetail.image ?? "photo")
            return cell
            
        case 1:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.nameReusedId, for: indexPath) as? PersonNameTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.personNameLabel.text = personsDetail.title
            return cell
            
        case 2:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.roleReusedId, for: indexPath) as? PersonRoleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.personRoleLabel.text = personsDetail.role
            return cell
            
        case 3:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.datesReusedId, for: indexPath) as? PersonDatesTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.personDatesLabel.text = personsDetail.years
            return cell
            
        case 4:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.emblemReusedId, for: indexPath) as? PersonEmblemTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.emblemImageView.image = UIImage(named: personsDetail.emblem ?? "photo")
            return cell
            
        case 5:
            guard let cell = personTableView.dequeueReusableCell(withIdentifier: K.Person.overviewReusedId, for: indexPath) as? PersonOverviewTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.personOverviewLabel.text = personsDetail.overview
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 400
        case 1:
            return UITableView.automaticDimension
        case 2:
            return 40
        case 3:
            return UITableView.automaticDimension
        case 4:
            return 150
        case 5:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
    
    
}
