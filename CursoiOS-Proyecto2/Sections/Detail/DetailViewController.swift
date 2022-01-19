//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static func create() -> DetailViewController {
        
        return  DetailViewController.init(nibName: "DetailViewController", bundle: .main)
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  

}
