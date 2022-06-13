//
//  ViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    // properties
    var collectionView: UICollectionView! = nil
    let monuments = Bundle.main.decode([Monument].self, from: "testData.json")
    var searchMonuments = [Monument]()
    
    //var monumentsData: Monument?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        searchMonuments = monuments
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        tabBarController?.tabBar.isHidden = false
        
    }
    
}

//MARK: - Setup UI Elements
extension GalleryViewController {
    
    private func setupUIElements() {
        setupNavigationBar()
        createCollectionView()
        setupSearchBar()
    }
    
    private func setupNavigationBar() {
        
//        let titleLabel = UILabel()
//        titleLabel.text = K.NavControllerTitle.gallery_title
//        titleLabel.font = UIFont(name: "Avenir", size: 20)
//        titleLabel.textColor = .black
        
        title = K.NavControllerTitle.gallery_title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)


    }
    
    // Setup CollectionView
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: K.gallery_ID_cell)
        
//        if #available(iOS 11.0, *) {
//
//            self.collectionView.contentInsetAdjustmentBehavior = .never
//        }
        
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск по Галерее"
        definesPresentationContext = true
        
        searchController.searchBar.searchTextField.textColor = .black
        searchController.searchBar.tintColor = .black
        searchController.searchBar.isTranslucent = true
        
    }
}

//MARK: - CollectionViewDelegate, CollectionViewDataSource
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchMonuments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.gallery_ID_cell, for: indexPath) as! GalleryCell
        
        
        
        cell.galleryImageView.image = UIImage(named: searchMonuments[indexPath.item].image)
        cell.titleLabel.text = searchMonuments[indexPath.item].title
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let monumentVC = MonumentViewController()
        monumentVC.monumentImageView.image = UIImage(named: searchMonuments[indexPath.item].image)
        monumentVC.titleLabel.text = searchMonuments[indexPath.item].title
        monumentVC.contentLabel.text = searchMonuments[indexPath.item].content
        
        navigationController?.pushViewController(monumentVC, animated: true)
    }
}

// MARK: CollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        return CGSize(width: width, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UISearchBarDelegatte, UISearchResultsUpdating
extension GalleryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            searchMonuments = monuments
            collectionView.reloadData()
            return
            
        }
        
        searchMonuments = monuments.filter({ monument -> Bool in
            monument.title.lowercased().contains(searchText.lowercased())
        })
        
        collectionView.reloadData()
    }
    
}
