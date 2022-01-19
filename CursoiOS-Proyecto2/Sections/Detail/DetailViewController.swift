//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import UIKit

struct DetailViewModel {
    
    let name: String
    let image: UIImage?
}



class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static func create() -> DetailViewController {
        
        return  DetailViewController.init(nibName: "DetailViewController", bundle: .main)
       
    }
    
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(with: viewModel)

        // Do any additional setup after loading the view.
    }

    func configure(with viewModel: DetailViewModel?) {
        
        guard let viewModel = viewModel else {return}
        
        imageView.image = viewModel.image
        nameLabel.text = viewModel.name
    }

  

}
