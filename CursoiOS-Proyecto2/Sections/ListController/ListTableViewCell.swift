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

protocol ListTableViewDelegate: AnyObject {
    
    func didPressInFavorite(cell: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    weak var delegate: ListTableViewDelegate?
    
    var isFavorite = false {
        
        didSet {
            
            if isFavorite {
                favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }else{
                favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
    
    override func prepareForReuse() {
        isFavorite = false
    }

    func configure(viewModel: ListTableCellViewModel) {
        
        nameLabel.text = viewModel.text
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: viewModel.imageUrl)
    }
    

    @IBAction func favoritePressed(_ sender: Any) {
        
        delegate?.didPressInFavorite(cell: self)
    }
}
