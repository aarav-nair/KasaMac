//
//  PythonRunner.swift
//  BatteryOptimizer
//
//  Created by Aarav Nair on 7/6/24.
//

import Foundation
import PythonKit

func getFile(name: String) -> PythonObject {
    let sys = Python.import("sys")
    sys.path.append("/Users/aaravnair/Documents/GitHub/KasaMac/KasaMac")
    sys.path.append("/Users/aaravnair/Documents/GitHub/KasaMac/KasaMac/proj_venv/lib/python3.12/site-packages")
    print(sys.path)

    let file = Python.import(name)
    return file
}

func getPercent() -> PythonObject {
    let file = getFile(name: "power")
    let response = file.currPercent()
    return response
}

func isCharging() -> PythonObject {
    let file = getFile(name: "power")
    let response = file.currCharging()
    return response
}

func discoverPlugs() -> PythonObject {
    let file = getFile(name: "plug")
    let response = file.findPlugs()
    
//    var swiftDict = [String: String]()
//    for (key, value) in response {
//        if let key = String(key), let value = String(value) {
//            swiftDict[key] = value
//        }
//    }
//    return swiftDict
    
    return response
}
