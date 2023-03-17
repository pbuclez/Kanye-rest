//
//  ContentView.swift
//  Kanye rest
//
//  Created by Pierre Buclez on 17/03/2023.
//

import SwiftUI


struct KanyeQuoteView: View {
    @State var stateController = StateController()

    var body: some View {
        VStack {
            Text("Random Kanye West quote:")
            Text(stateController.getQuotes())
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}
