//
//  KasaViewModel.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/14/24.
//

import Foundation
import PythonKit
import SwiftUI

class KasaViewModel: ObservableObject {
    @Published var discovered: Bool = false
    @Published var plugs: [PlugItem] = []
    @Published var currPlug: PlugItem?
    @Published var minimum: Int = 20
    @Published var maximum: Int = 80
    @Published var target: Int = 80
    @Published var time: Date = Date.now
    
    func discoverPlugs() {
        let file = getFile(name: "plug")
        let response = file.findPlugs()
        
        let names = response[0]
        let addresses = response[1]
        let isOn = response[2]
        let len = names.count
        var result: [PlugItem] = []

        (0..<len).forEach { i in
            let bool = Bool("\(isOn[i])".lowercased())
            let plug = PlugItem(name: "\(names[i])", address: "\(addresses[i])", isOn: bool ?? false)
            result.append(plug)
        }
        self.plugs = result
    }
}

struct PlugItem: Hashable {
    var name: String
    var address: String
    var isOn: Bool
}
