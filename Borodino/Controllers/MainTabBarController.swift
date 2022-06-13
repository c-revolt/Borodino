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
        
        let galleryViewController = TestHomeController()
        let mapViewController = MapViewController()
        let infoViewController = InfoViewController()
        
        let galleryNavigationContoller = UINavigationController(rootViewController: galleryViewController)
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)
        
        galleryNavigationContoller.tabBarItem = UITabBarItem(title: K.NavControllerTitle.gallery_title, image: K.tabBarImageTitles.gallery_controller , tag: 1)
        mapNavigationController.tabBarItem = UITabBarItem(title: K.NavControllerTitle.map_title, image: K.tabBarImageTitles.map_contoller, tag: 2)
        infoNavigationController.tabBarItem = UITabBarItem(title: K.NavControllerTitle.info_title, image: K.tabBarImageTitles.info_controller, tag: 3)
        
        setViewControllers([galleryNavigationContoller, mapNavigationController, infoNavigationController], animated: true)
    }
    
}
