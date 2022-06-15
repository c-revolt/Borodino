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
        
        
        let galleryNavigationContoller = UINavigationController(rootViewController: galleryViewController)
        
        
        galleryNavigationContoller.tabBarItem = UITabBarItem(title: K.NavControllerTitle.gallery_title, image: UIImage(systemName: "arrowtriangle.up.fill") , tag: 1)
        placesViewController.tabBarItem = UITabBarItem(title: " Места", image: UIImage(systemName: "move.3d") , tag: 2)
    
        
        setViewControllers([galleryNavigationContoller, placesViewController], animated: true)
        
        tabBar.tintColor = .white
        
    }
    
    
    
}
