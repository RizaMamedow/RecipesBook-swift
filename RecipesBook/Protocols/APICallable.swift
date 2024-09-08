//
//  APICallable.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation


protocol ApiCaller{
    var urlString: String { get }
}

class APICaller<T: Decodable>: ApiCaller {
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func performCall(callback: @escaping (T) -> Void) -> Void{
        guard let url = URL(string: self.urlString) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        callback(decodedData)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

