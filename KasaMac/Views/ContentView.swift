//
//  ContentView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = KasaViewModel()
    
    var body: some View {
        VStack {
            if (!viewModel.discovered) {
                Button {
                    viewModel.discoverPlugs()
                } label: {
                    Text("Discover Plugs")
                }
            }
                
            else {
                ForEach(viewModel.plugs.sorted(by: >), id: \.key) { key, value in
                    PlugRowView(viewModel: viewModel)
                            }
            }
        }
            .padding()
    }
}

#Preview {
    ContentView()
}
