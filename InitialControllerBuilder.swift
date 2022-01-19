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
        let mockController = UIViewController()
        mockController.view.backgroundColor = .blue
        let navigationController = UINavigationController(rootViewController: mockController)
        
        return navigationController
    }
}
