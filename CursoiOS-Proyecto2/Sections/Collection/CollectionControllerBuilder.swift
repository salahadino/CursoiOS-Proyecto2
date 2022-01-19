//
//  CollectionControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import Foundation
import UIKit

class CollectionControllerBuilder {
    
    func build() -> UIViewController {
        
        let viewController = CollectionViewController.createFromStoryboard()
        viewController.fetchLandmarks = FetchLandmarksFromDisk()
        
        return viewController
    }
}
