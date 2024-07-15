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
    return response
}

func turnOn(address: String) {
    let file = getFile(name: "plug")
    file.turn_on(address)
}

func turnOff(address: String) {
    let file = getFile(name: "plug")
    file.turn_off(address)
}

func optimizer(address: String, lower: Int, upper: Int) {
    let file = getFile(name: "plug")
    file.auto(address, lower, upper)
}


