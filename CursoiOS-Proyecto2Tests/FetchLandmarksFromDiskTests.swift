//
//  FetchLandmarksFromDiskTests.swift
//  CursoiOS-Proyecto2Tests
//
//  Created by Miguel Santiago on 19/1/22.
//

import XCTest
@testable import CursoiOS_Proyecto2

class FetchLandmarksFromDiskTests: XCTestCase {

    func testShouldFetchLandmarksFromFile() {
        let sut = FetchLandmarksFromDisk()
        sut.fetchLandmarks { result in
            switch result {
            case .success(let landmarks):
                XCTAssertFalse(landmarks.isEmpty)
            case .failure(let error): XCTFail(error.localizedDescription)
            }
        }
    }
}
