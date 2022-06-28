//
//  MonumentTableViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class MonumentTableViewController: UIViewController {

    private var monuments: [MMonument] = [MMonument]()
    let monumentsJSONData = Bundle.main.decode([MMonument].self, from: "monumentsData.json")
    private var timer = Timer()
    private var searching = false
    private var searchingMonument = [MMonument]()
    
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
        
        monuments = monumentsJSONData
        
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
        if searching {
            return searchingMonument.count
        } else {
            return monuments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let monuments = monuments[indexPath.row]
        let searchingMonument = monuments
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MonumentTableViewCell.reusedId, for: indexPath) as? MonumentTableViewCell else {
            return UITableViewCell()
        }
        
        if searching {
            cell.configure(with: MonumentViewModel(id: nil, title: searchingMonument.title, image: searchingMonument.image ?? "photo", source: searchingMonument.source, address: searchingMonument.address, overview: nil))
        } else {
            cell.configure(with: MonumentViewModel(id: nil, title: monuments.title, image: monuments.image ?? "photo", source: monuments.source, address: monuments.address, overview: nil))
        }
        
        
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let monument = monuments[indexPath.row]
        
            
        let detailVC = TableMonumentViewController()
        detailVC.monumentDetail = monument
        detailVC.modalTransitionStyle = .coverVertical
        detailVC.modalPresentationStyle = .fullScreen
        //navigationController?.present(detailVC.self, animated: true)
        navigationController?.pushViewController(detailVC, animated: true)

        
    }
    
}

extension MonumentTableViewController: UISearchBarDelegate {
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//             print(searchText)
//    }
    
    func updateResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        if !searchText.isEmpty {
            searching = true
            searchingMonument.removeAll()
            
            for monument in monuments {
                if ((monument.title?.lowercased().contains(searchText.lowercased())) != nil) {
                    searchingMonument.append(monument)
                }
            }
            
        } else {
            searching = false
            searchingMonument.removeAll()
            searchingMonument = monuments
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchingMonument.removeAll()
        
        tableView.reloadData()
    }
    
}

