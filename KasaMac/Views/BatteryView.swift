//
//  BatteryView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/14/24.
//

import Foundation
import SwiftUI

struct BatteryView: View {
    @ObservedObject var viewModel: KasaViewModel
    @State private var isShown: Bool = false

    var body: some View {
        VStack {
            Toggle(isOn: $isShown, label: {
                Text("Battery Optimizing")
            }).keyboardShortcut("b")
            
            if isShown {
                Picker(selection: $viewModel.currPlug) {
                    ForEach($viewModel.plugs, id: \.self) { $plug in
                        Text(plug.name)
                    }
                } label: {
                    Text("Plug")
                }
                .pickerStyle(.menu)
                .onChange(of: viewModel.currPlug) {
                    let address = viewModel.currPlug?.address
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        optimizer(address: address!, lower: viewModel.minimum, upper: viewModel.maximum)
                    }
                }
            }
        }
    }
}

#Preview {
    PlugRowView(viewModel: KasaViewModel())
}
