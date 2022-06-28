//
//  PlacesViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 15.06.2022.
//

import UIKit

class PlacesViewController: UIViewController {
    
    var places: [MMonument] = [MMonument]()
    let placesJSONData = Bundle.main.decode([MMonument].self, from: "places.json")
    
    private let placesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupTableView()
        
        places = placesJSONData
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        placesTableView.frame = view.bounds
    }
    
    private func setupNavigationBar() {
        
        title = "Места"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    private func setupTableView(){
        view.addSubview(placesTableView)
        placesTableView.backgroundColor = .systemBackground
        placesTableView.translatesAutoresizingMaskIntoConstraints = false
        placesTableView.rowHeight = 270
        
        placesTableView.delegate = self
        placesTableView.dataSource = self
        
        placesTableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.reusedId)
    }
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let place = places[indexPath.row]
        
        guard let cell = placesTableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.reusedId, for: indexPath) as? PlacesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: MonumentViewModel(id: nil, title: place.title, image: place.image ?? "photo", source: nil, address: nil, overview: nil))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let place = places[indexPath.row]
        
            
        let detailVC = PlacesDetailViewController()
        detailVC.placeDetail = place
        detailVC.modalTransitionStyle = .coverVertical
        detailVC.modalPresentationStyle = .fullScreen
        //navigationController?.present(detailVC.self, animated: true)
        navigationController?.pushViewController(detailVC, animated: true)

        
    }
    
}
