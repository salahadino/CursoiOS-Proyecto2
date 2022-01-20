//
//  ListViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 19/1/22.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetchCats: FetchCatsUseCase?
    
    var fetchLandmarks: FetchLandmarksUseCase?
    
    //var detailBuilder: DetailControllerBuilder?
    
    static func createFromStoryboard() -> ListViewController {
        
        return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
        

    }
    
    private var cats = [Cat]() {
        
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    private var favorites = [String]()
    
//    private func fetchData() {
//
//        fetchLandmarks?.fetchLandmarks( { result in
//            switch result {
//            case .success(let landmarks): self.landmarks = landmarks
//
//
//            case .failure: break
//
//            }
//        })
//    }
    
    private func fetchData() {
        
        fetchCats?.fetchCats(completion: { cats in
            self.cats = cats
        })
    }
    

}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        let cat = cats[indexPath.row]
        
        cell.configure(viewModel: ListTableCellViewModel(imageUrl: cat.imageUrl, text: cat.tagsText))
        
        cell.delegate = self
        cell.isFavorite = favorites.contains(cat.id)
        
        
        
        
//        cell.textLabel?.text = cat.tagsText
//        cell.imageView?.kf.setImage(with: cat.imageUrl)
        
//        if let url = cat.imageUrl, let data =  try? Data(contentsOf: url){
//
//            cell.imageView?.image = UIImage(data: data)
//        }
        
        
        
        
        return cell
        
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        guard let detailController = detailBuilder?.build() else {
//            return
//        }
        
        
//        let landmark = landmarks[indexPath.row]
//
//
//        let detailController = DetailControllerBuilder().build(viewModel: landmark.toDetailViewModel)
//
//        navigationController?.pushViewController(detailController, animated: true)
        
        let cat = cats[indexPath.row]
        let detailController = DetailControllerBuilder().build(viewModel: cat.toDetailViewModel)
        
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ListViewController: ListTableViewDelegate {
    func didPressInFavorite(cell: ListTableViewCell) {
        print("favoritepressed")
        
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        cell.isFavorite = !cell.isFavorite
        
        let cat = cats[indexPath.row]
        
        if cell.isFavorite {
            favorites.append(cat.id)
        }else if let index = favorites.firstIndex(of: cat.id){
            
            favorites.remove(at: index)
        }
    }
    
    
    
}

