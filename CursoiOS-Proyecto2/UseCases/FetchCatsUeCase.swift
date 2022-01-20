//
//  FetchCatsUeCase.swift
//  CursoiOS-Proyecto2
//
//  Created by Oscar Cazallas Esteban on 20/1/22.
//

import Foundation
import UIKit
import Alamofire

protocol FetchCatsUseCase {
    
    func fetchCats(completion: @escaping ([Cat]) -> Void)
}

class FetchCatsFromAPI: FetchCatsUseCase {
    func fetchCats(completion: @escaping ([Cat]) -> Void) {
        
        guard let url = URL(string: "https://cataas.com/api/cats") else {
            completion([])
            return
        }
        
        
        let request = URLRequest(url: url)
        
        AF.request(request).responseDecodable { (response: DataResponse<[Cat], AFError>) in
            switch response.result {
                
            case .success(let cats): completion(cats)
            case .failure: completion([])
            }
        }.validate()
        
        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//
//                completion([])
//
//                return
//            }
//
//            do {
//
//                let cats = try JSONDecoder().decode([Cat].self, from: data)
//                completion(cats)
//            }catch {
//
//                completion([])
//            }
//
//
//        }.resume()
   }
 
}

