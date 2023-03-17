//
//  ContentView.swift
//  Kanye rest
//
//  Created by Pierre Buclez on 17/03/2023.
//

import SwiftUI


struct KanyeQuoteView: View {
    @State var quote: String = ""

    var body: some View {
        VStack {
            Text("Random Kanye West quote:")
            Text(quote)
                .padding()
                .multilineTextAlignment(.center)
        }
        .onAppear {
            let url = URL(string: "https://api.kanye.rest/")!
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(KanyeQuoteResponse.self, from: data)
                        self.quote = response.quote
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
}

struct KanyeQuoteResponse: Decodable {
    let quote: String
}
