//
//  PlugRowView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import Foundation
import SwiftUI

struct PlugRowView: View {
    @ObservedObject var viewModel: KasaViewModel

    var body: some View {
        ScrollView {
            ForEach($viewModel.plugs, id: \.self) { $plug in
                HStack {
                    Toggle(isOn: $plug.isOn, label: {
                        Text(plug.name)
                    })
                    
                    if plug.isOn {
                        turnOn(address: plug.address)
                    }
                    else {
                        turnOff(address: plug.address)
                    }
                }
//                .onChange(of: $plug.isOn) { oldValue, newValue in
//                    if $plug.isOn {
//                        turnOn(address: plug.address)
//                    }
//                    else {
//                        turnOff(address: plug.address)
//                    }
//                }
            }
        }
    }
}

#Preview {
    PlugRowView(viewModel: KasaViewModel())
}
