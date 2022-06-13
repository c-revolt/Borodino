//
//  HomeViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 09.06.2022.
//

import UIKit

enum Sections: Int {
    case paintings = 0
    case persons = 1
    case monuments = 2
    case places = 3
    case interesting = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = [K.SectionTitles.paintings, K.SectionTitles.presons, K.SectionTitles.monuments, K.SectionTitles.places, K.SectionTitles.interesting]
    
    let paintings = Bundle.main.decode([Monument].self, from: "paintings.json")
    
    private let feedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewInTableViewCell.self, forCellReuseIdentifier: K.collectionViewInTableViewCell)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        feedTableView.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewInTableViewCell.identifire, for: indexPath) as? CollectionViewInTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
    
}
