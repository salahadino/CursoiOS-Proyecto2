//
//  CollectionViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchLandmarks: FetchLandmarksUseCase?
    
    static func createFromStoryboard() -> CollectionViewController {
        
        return UIStoryboard(name: "CollectionViewController", bundle: .main).instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        fetchData()
        

        // Do any additional setup after loading the view.
    }
    
    private var landmarks = [Landmark]() {
        
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var layout: UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
        let width = (collectionView.frame.width / 2) - (layout.minimumInteritemSpacing / 2) - layout.sectionInset.left
        layout.itemSize = CGSize(width: width, height: width)
        
        return layout
    }
    
    private func fetchData() {
        
        fetchLandmarks?.fetchLandmarks( { result in
            switch result {
            case .success(let landmarks): self.landmarks = landmarks
               
                
            case .failure: break
                
            }
        })
    }
    

  

}


extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CellCollectionViewCell else {
            fatalError()
            
        }
        
        let model = landmarks[indexPath.row]
        cell.imageCollection.image = model.image
        cell.labelCollection.text = model.name
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarks.count
    }
}
