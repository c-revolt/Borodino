//
//  MonumentTableViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class MonumentTableViewController: UIViewController {

    private var gallery: [MGallery] = [MGallery]()
    let monumentsJSONData = Bundle.main.decode([MGallery].self, from: "monuments.json")
    private var timer = Timer()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        
        table.register(MonumentTableViewCell.self, forCellReuseIdentifier: MonumentTableViewCell.reusedId)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        gallery = monumentsJSONData
        
        setupNavigationBar()
        setupSearchBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

    
    private func setupNavigationBar() {
        
        title = "Памятники"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск памятников..."
        
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.tintColor = .white
        searchController.searchBar.isTranslucent = true
        
    }
    

}

extension MonumentTableViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gallery = gallery[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MonumentTableViewCell.reusedId, for: indexPath) as? MonumentTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: MonumentViewModel(image: gallery.image ?? "photo", title: gallery.title, years: gallery.years, emblem: gallery.emblem, overview: gallery.overview))
//
//        cell.nameLabel.text = cafes[indexPath.row].name
//        cell.locationLabel.text = cafes[indexPath.row].location
//        cell.typeLabel.text = cafes[indexPath.row].type
//        cell.thumbnailImageView.image = UIImage(named: cafes[indexPath.row].image)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}

extension MonumentTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             print(searchText)
    }
}
