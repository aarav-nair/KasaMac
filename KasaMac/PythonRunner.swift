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
    print("Python \(sys.version_info.major).\(sys.version_info.minor)")
    print("Python Version: \(sys.version)")
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
//    PythonLibrary.useVersion(3, 8)
    let sys = Python.import("sys")
    sys.path.append("/Users/aaravnair/Documents/GitHub/KasaMac/KasaMac")
    sys.path.append("/Users/aaravnair/Documents/GitHub/KasaMac/KasaMac/proj_venv/lib/python3.12/site-packages")
    let file = Python.import("plug")
    let response = file.findPlugs()
    return response
}
