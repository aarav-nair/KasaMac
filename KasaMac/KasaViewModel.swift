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
    @Published var plugs: [String: String] = [:]
    
    func discoverPlugs() -> [String: String] {
        let file = getFile(name: "plug")
        let response = file.findPlugs()
        
    //    var swiftDict = [String: String]()
    //    for (key, value) in response {
    //        if let key = String(key), let value = String(value) {
    //            swiftDict[key] = value
    //        }
    //    }
    //    return swiftDict
        let keys = response.keys
        var swiftDict: [String: String] = [:]
        response.forEach { py in
        }
        
        ForEach(response, id: \.key) { key, value in
            Text("**\(key)**: \(value)")
        }
        
        for key in response.keys {
            swiftDict[key] = response[key]
        }
        
        return swiftDict
    }
}
