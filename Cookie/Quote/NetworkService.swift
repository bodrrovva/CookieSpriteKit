//
//  NetworkServise.swift
//  Cookie
//
//  Created by muntyanu on 11.02.2023.
//

import Foundation

struct NetworkService {
    
    func performRequest(completionHandler: @escaping (Disription) -> Void) {
        guard let url = URL(string:"https://zenquotes.io/api/random") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(Disription.self, from: data)
                completionHandler(json)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}

struct DisriptionElement: Codable {
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "q"
        case author = "a"
    }
}

typealias Disription = [DisriptionElement]

