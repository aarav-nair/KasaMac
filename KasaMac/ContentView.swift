//
//  ContentView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "31"
    @State var plugs: [String] = []
    @State var discovered: Bool = false
    var body: some View {
        VStack {
            if (!discovered) {
                Button {
                    text = String("\(discoverPlugs())")
                    discovered = true
                } label: {
                    Text("Discover Plugs")
                }
            }
                
            else {
                PlugRowView(name: text)
            }
        }
            .padding()
    }
}

#Preview {
    ContentView()
}
