//
//  NetworkManager.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

protocol NetworkProtocol: AnyObject {
    func getData(searchText: String, completion: @escaping (Data?) -> Void)
}

class NetworkManager: NetworkProtocol {
    func getData(searchText: String, completion: @escaping (Data?) -> Void) {
        let urlString = "https://dummyimage.com/500x500/de8f45/e1e1e8.jpg&text=\(searchText)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                completion(nil)
                print(error.localizedDescription)
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            if statusCode != 200 {
                print("Status Code = \(String(describing: statusCode))")
                completion(nil)
                return
            }
            guard let data else {
                print("data = nil")
                completion(nil)
                return
            }
          completion(data)
        }
        task.resume()
    }
}
