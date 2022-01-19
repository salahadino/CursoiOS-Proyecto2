//
//  InitialControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Miguel Santiago on 19/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    
    func build() -> UIViewController {
        let viewController = ListControllerBuilder().build()
//        viewController.view.backgroundColor = .red
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        
        
        let collectionController = CollectionControllerBuilder().build()
        let collectionNavigation = UINavigationController(rootViewController: collectionController)
        collectionController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage.init(systemName: "list.bullet"), tag: 1)
        
        
        let tabBarcontroller = UITabBarController()
        tabBarcontroller.setViewControllers([navigationController, collectionNavigation], animated: false)
        
        
        return tabBarcontroller
    }
}


