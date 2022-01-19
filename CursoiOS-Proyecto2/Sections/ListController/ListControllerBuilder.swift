//
//  ListControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import Foundation
import UIKit


class ListControllerBuilder {
    
    func build() -> UIViewController {
        
        let viewController = ListViewController.createFromStoryboard()
        
        //viewController.detailBuilder = DetailControllerBuilder()
        
        viewController.fetchLandmarks = FetchLandmarksFromDisk()
        
       
        return viewController
    }
    
    
}
