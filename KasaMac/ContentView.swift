//
//  ContentView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "31"
    var body: some View {
        VStack {
            Button {
                text = String("\(discoverPlugs())")
            } label: {
                Text("Label")
            }
            Text(text)
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            Text(String("\(discoverPlugs())"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
