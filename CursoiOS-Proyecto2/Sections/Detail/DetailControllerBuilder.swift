//
//  DetailControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import Foundation
import UIKit

class DetailControllerBuilder {
    
    func build(viewModel: DetailViewModel) -> UIViewController {
        
        let viewController = DetailViewController.create()
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
