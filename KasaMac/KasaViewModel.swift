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
    @Published var plugs: [KasaRowViewModel] = []
    @Published var currPlug: KasaRowViewModel?
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
        var result: [KasaRowViewModel] = []

        (0..<len).forEach { i in
            let bool = Bool("\(isOn[i])".lowercased())
            let plug = KasaRowViewModel(name: "\(names[i])", address: "\(addresses[i])", isOn: bool ?? false)
            result.append(plug)
        }
        self.plugs = result
    }
}

class KasaRowViewModel: ObservableObject, Hashable {
    let id: UUID
    @Published var name: String
    @Published var address: String
    @Published var isOn: Bool
    
    init(name: String, address: String, isOn: Bool) {
        self.id = UUID()
        self.name = name
        self.address = address
        self.isOn = isOn
    }
    
    static func == (lhs: KasaRowViewModel, rhs: KasaRowViewModel) -> Bool {
            return lhs.id == rhs.id
        }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
