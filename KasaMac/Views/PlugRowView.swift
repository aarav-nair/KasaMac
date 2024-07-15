//
//  PlugRowView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import Foundation
import SwiftUI
private struct NamedFont: Identifiable {
    let name: String
    let font: Font
    var id: String { name }
}

struct PlugRowView: View {
    @ObservedObject var viewModel: KasaViewModel

    var body: some View {
        @State var plugs = viewModel.plugs
        let last = plugs.count - 1
        ScrollView {
            ForEach($plugs, id: \.self) { $plug in
                HStack {
                    Toggle(isOn: $plug.isOn, label: {
                        Text(plug.name)
                    })
                }
                if plugs[last] != plug {
                    Divider()
                }
            }
        }
    }
}

#Preview {
    PlugRowView(viewModel: KasaViewModel())
}
