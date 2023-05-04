//
//  HomeViewModel.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import Foundation
protocol HomeViewModelProtocol: ViewModelProtocol {
    func getImage(searchText: String, completion: @escaping (Data?) -> Void)
    func createLike(text: String, image: Data)
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol, coreDataManager: CoreDataManagerProtocol) {
        self.networkManager = networkManager
        self.coreDataManager = coreDataManager
    }
    
    func getImage(searchText: String, completion: @escaping (Data?) -> Void) {
        networkManager.getData(searchText: searchText) { data in
            completion(data)
        }
    }
    
    func createLike(text: String, image: Data)  {
        coreDataManager.createLike(text: text, image: image)
    }
}

