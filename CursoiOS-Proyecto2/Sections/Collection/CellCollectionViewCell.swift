//
//  CellCollectionViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import UIKit

struct CollectionCellViewModel {
    let name: String
    let image: UIImage?
}

class CellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelCollection: UILabel!
    @IBOutlet weak var imageCollection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: CollectionCellViewModel){
        
        labelCollection.text = viewModel.name
        imageCollection.image = viewModel.image
    }
    
}
