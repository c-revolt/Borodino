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
        let placesViewController = PlacesViewController()
        let memorialsViewController = MonumentTableViewController()
        
        
        let galleryNavigationContoller = UINavigationController(rootViewController: galleryViewController)
        let memorialsNavigationController = UINavigationController(rootViewController: memorialsViewController)
        let placesNavigationController = UINavigationController(rootViewController: placesViewController)
        
        
        galleryNavigationContoller.tabBarItem = UITabBarItem(title: K.NavControllerTitle.gallery_title, image: UIImage(systemName: "building.columns") , tag: 1)
        memorialsNavigationController.tabBarItem = UITabBarItem(title: "Памятники", image: UIImage(systemName: "rectangle.grid.2x2"), tag: 2)
        placesViewController.tabBarItem = UITabBarItem(title: "Места", image: UIImage(systemName: "signpost.right") , tag: 3)
    
        
        setViewControllers([galleryNavigationContoller, memorialsNavigationController, placesNavigationController], animated: true)
        
        tabBar.tintColor = .white
        
    }
}
