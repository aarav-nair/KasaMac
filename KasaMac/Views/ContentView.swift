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
                    viewModel.discovered = true
                } label: {
                    Text("Discover Plugs")
                }
            }
                
            else {
                PlugRowView(viewModel: viewModel)
                Divider()
                BatteryView(viewModel: viewModel)
            }
        }
            .padding()
    }
}

#Preview {
    ContentView()
}
