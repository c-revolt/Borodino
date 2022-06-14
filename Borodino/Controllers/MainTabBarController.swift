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
        
        
        let galleryNavigationContoller = UINavigationController(rootViewController: galleryViewController)
        
        
        galleryNavigationContoller.tabBarItem = UITabBarItem(title: K.NavControllerTitle.gallery_title, image: K.tabBarImageTitles.gallery_controller , tag: 1)
    
        
        setViewControllers([galleryNavigationContoller], animated: true)
        
    }
    
}
