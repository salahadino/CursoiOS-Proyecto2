//
//  FetchLandmarksUseCase.swift
//  CursoiOS-Proyecto2
//
//  Created by Miguel Santiago on 19/1/22.
//

import Foundation

enum FetchLandmarksError: Error {
    case unableToFindFile, parseError(Error?)
}

protocol FetchLandmarksUseCase {
    func fetchLandmarks(_ completion: @escaping (Result<[Landmark], FetchLandmarksError>) -> ())
}

class FetchLandmarksFromDisk {
    private let bundle: Bundle
    private let resourceName: String
    private let decoder: JSONDecoder
    
    init(bundle: Bundle = .main, resourceName: String = "landmarkData.json", decoder: JSONDecoder = .init()) {
        self.bundle = bundle
        self.resourceName = resourceName
        self.decoder = decoder
    }
}

extension FetchLandmarksFromDisk: FetchLandmarksUseCase {
    func fetchLandmarks(_ completion: @escaping (Result<[Landmark], FetchLandmarksError>) -> ()) {
        guard let file = bundle.url(forResource: resourceName, withExtension: nil) else {
            completion(.failure(.unableToFindFile))
            return
        }
        
        do {
            let data = try Data(contentsOf: file)
            let landmarks = try decoder.decode([Landmark].self, from: data)
            completion(.success(landmarks))
        } catch {
            completion(.failure(.parseError(error)))
        }
    }
}
