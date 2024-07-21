//
//  KasaMacApp.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/6/24.
//

import SwiftUI

@main
struct KasaMacApp: App {
    var body: some Scene {
        MenuBarExtra("", systemImage: "powerplug") {
            ContentView()
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
}
