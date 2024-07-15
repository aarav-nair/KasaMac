//
//  BatteryView.swift
//  KasaMac
//
//  Created by Aarav Nair on 7/14/24.
//

import Foundation
import SwiftUI

struct BatteryView: View {
    @ObservedObject var viewModel: KasaViewModel
    @State private var isShown: Bool = false
//    var helloWorldTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true)


    var body: some View {
//        @State var plugs = viewModel.plugs
        VStack {
            Toggle(isOn: $isShown, label: {
                Text("Battery Optimizing")
            })
            
            if isShown {
                Picker(selection: $viewModel.currPlug) {
                    ForEach($viewModel.plugs, id: \.self) { $plug in
                        Text(plug.name)
                    }
                } label: {
                    Text("Plug")
                }.pickerStyle(.menu)
//
//                Picker(selection: $minimum) {
//                    ForEach([1, 2, 3], id: \.self) { $plug in
//                        Text("\(plug)")
//                    }
//                } label: {
//                    Text("Minimum Percent")
//                }
//
//                Picker(selection: $viewModel.maximum) {
//                    ForEach(Array(75...85), id: \.self) { $num in
//                        Text(num)
//                    }
//                } label: {
//                    Text("Maximum Percent")
//                }.pickerStyle(.wheel)
//                
//                Picker(selection: $viewModel.target) {
//                    ForEach(Array(70...100), id: \.self) { $num in
//                        Text(num)
//                    }
//                } label: {
//                    Text("Target Percent")
//                }.pickerStyle(.wheel)
//                
                DatePicker("Please enter a time", selection: $viewModel.time, displayedComponents: .hourAndMinute)

//                Picker("Plug", selection: $viewModel.currPlug) {
//                    ForEach($plugs, id: \.self) { $plug in
//                        Text(plug.name)
//                    }
//                }.pickerStyle(.menu)
                
                
            }
        }
    }
}

#Preview {
    PlugRowView(viewModel: KasaViewModel())
}
