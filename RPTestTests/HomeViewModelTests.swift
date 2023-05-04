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
    
    var viewModel: HomeViewModel!
    var mockNetworkManager: MockNetworkManager!
    var mockCoreDataManager: MockCoreDataManager!
    
    override func setUpWithError() throws {
        mockNetworkManager = MockNetworkManager()
        mockCoreDataManager = MockCoreDataManager()
        viewModel = HomeViewModel(networkManager: mockNetworkManager, coreDataManager: mockCoreDataManager)
    }
    override func tearDownWithError() throws {
        viewModel = nil
        mockNetworkManager = nil
        mockCoreDataManager = nil
    }
    
    func testGetImage() {
        let searchText = "test"
        let expectedData = Data()
        var actualData: Data?
        
        mockNetworkManager.getDataHandler = { searchText, completion in
            completion(expectedData)
        }
        
        viewModel.getImage(searchText: searchText) { data in
            actualData = data
        }
        
        XCTAssertEqual(actualData, expectedData)
        XCTAssertEqual(mockNetworkManager.getDataCalledWithSearchText, searchText)
    }
}

class MockNetworkManager: NetworkProtocol {
    
    var getDataCalledWithSearchText: String?
    var getDataHandler: ((String, (Data?) -> Void) -> Void)?
    
    func getData(searchText: String, completion: @escaping (Data?) -> Void) {
        getDataCalledWithSearchText = searchText
        getDataHandler?(searchText, completion)
    }
}

class MockCoreDataManager: CoreDataManagerProtocol {
    func createLike(text: String, image: Data) {
        
    }
    
    func getLike() -> [RPTest.Like] {
        let like = [RPTest.Like]()
        return like
    }
    
    func deleteLike(like: RPTest.Like) {
        
    }
    
}
/*
В этom тесте мы создаем экземпляр класса HomeViewModel и передаем ему два mock-объекта: MockNetworkManager и MockCoreDataManager. Затем мы вызываем метод getImage нашего viewModel и проверяем, что он вызывает соответствующий метод на mock-объекте. Также мы проверяем, что метод getImage возвращает ожидаемые данные.
*/
