//
//  APICaller.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation


protocol APICallerProtocol{
    var urlString: String { get }
}

class APICaller<T: Decodable>: APICallerProtocol {
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    
    private func initUrl(urlString: String, _ parameters: [String: String]) -> URL {
        guard var url = URL(string: self.urlString) else { fatalError("Missing URL") }
        for (key, value) in parameters {
            url.append(queryItems: [.init(name: key, value: value)])
        }
        return url
    }
    
    func performCall( _ parameters: [String: String] = [:], callback: @escaping (T) -> Void) -> Void{
        let url = initUrl(urlString: self.urlString, parameters)
        
        
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

