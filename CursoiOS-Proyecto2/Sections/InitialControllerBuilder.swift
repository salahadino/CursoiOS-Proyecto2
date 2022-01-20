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
        
        //CREAMOS VIEWCONTROLLER DEL TABLEVIEW
        let viewController = ListControllerBuilder().build()

        
        //CREAMOS EL NAVIGATION CONTROLLER DEL VIEWCONTROLLER DEL TABLEVIEW
        let navigationController = UINavigationController(rootViewController: viewController)
        
        //SETEAMOS EL TAB BAR
        navigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        
        
        //CREAMOS VIEWCONTROLLER DEL COLLECTIONVIEW
        let collectionController = CollectionControllerBuilder().build()
        
        //CREAMOS EL NAVIGATION CONTROLLER DEL VIEWCONTROLLER DEL COLLECTIONVIEW
        let collectionNavigation = UINavigationController(rootViewController: collectionController)
        
        //SETEAMOS EL TAB BAR
        collectionController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage.init(systemName: "list.bullet"), tag: 1)
        
        //CREAMOS EL TABBAR CONTROLLER
        let tabBarcontroller = UITabBarController()
        
        //AÑADIMOS AL TABBAR CONTROLLER EL ARRAY CON SUS RESPECTIVAS VISTAS
        tabBarcontroller.setViewControllers([navigationController, collectionNavigation], animated: false)
        
        
        return tabBarcontroller
    }
}


