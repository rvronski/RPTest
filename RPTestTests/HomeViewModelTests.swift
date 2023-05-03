//
//  RPTestTests.swift
//  RPTestTests
//
//  Created by ROMAN VRONSKY on 04.05.2023.
//

import XCTest
import Foundation
@testable import RPTest

final class HomeViewModelTests: XCTestCase {

    
    let viewModel = HomeViewModel(networkManager: NetworkManager(), coreDataManager: CoreDataManager())
    
    func testLoadData() {
        viewModel.getImage(searchText: "Cat") { data in
            XCTAssertNotNil(data)
        }
    }
}
