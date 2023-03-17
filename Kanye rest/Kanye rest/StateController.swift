//
//  StateController.swift
//  Kanye rest
//
//  Created by Pierre Buclez on 17/03/2023.
//

import Foundation

class StateController: ObservableObject {
    
    func getQuotes() {
        let url = URL(string: "https://api.kanye.rest/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(KanyeQuoteResponse.self, from: data)
                    return response.quote
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error making API request: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    
    
}
