//
//  ListTableViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 20/1/22.
//

import UIKit
import Kingfisher

struct ListTableCellViewModel {
    
    let imageUrl: URL?
    let text: String
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: ListTableCellViewModel) {
        
        nameLabel.text = viewModel.text
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: viewModel.imageUrl)
    }
    

    @IBAction func favoritePressed(_ sender: Any) {
        
        
    }
}
