//
//  MainTabBarController.swift
//  Borodino
//
//  Created by Александр Прайд on 09.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
    }
    
    private func setupControllers() {
        
        let galleryViewController = GalleryViewController()
        let monumentsViewController = MonumentTableViewController()
        let placesViewController = PlacesViewController()
        
        
        
        let galleryNavigationContoller = UINavigationController(rootViewController: galleryViewController)
        let placesNavigationController = UINavigationController(rootViewController: placesViewController)
        let monumentsNavigationController = UINavigationController(rootViewController: monumentsViewController)
        
        
        galleryNavigationContoller.tabBarItem = UITabBarItem(title: K.TabBarTitles.gallery, image: UIImage(systemName: "building.columns") , tag: 1)
        monumentsNavigationController.tabBarItem = UITabBarItem(title: K.TabBarTitles.monuments, image: UIImage(systemName: "arrowtriangle.down"), tag: 2)
        placesViewController.tabBarItem = UITabBarItem(title: K.TabBarTitles.places, image: UIImage(systemName: "signpost.right") , tag: 3)
    
        
        setViewControllers([galleryNavigationContoller, monumentsNavigationController, placesNavigationController], animated: true)
        
        tabBar.tintColor = .white
        
    }
}
