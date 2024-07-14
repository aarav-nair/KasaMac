//
//  PlugRowView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import Foundation
import SwiftUI

struct PlugRowView: View {
    @ObservedObject var viewModel: KasaViewModel()

    var body: some View {
        HStack {
            Spacer()
            Toggle(isOn: $viewModel, label: {
                Text("name")
            })
            Spacer()
        }
    }
}

#Preview {
    PlugRowView()
}
