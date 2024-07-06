//
//  ContentView.swift
//  BLEApp
//
//  Created by Peter Kang on 7/5/24.
//

import SwiftUI
struct ContentView: View {
 @StateObject var bluetoothManager = BluetoothManager() // this is Bluetooth manager

    var body: some View {
  VStack {
    Button(action: {
                bluetoothManager.toggleBluetooth()
            }) {
        Text(bluetoothManager.isBluetoothEnabled ? "Turn Off Bluetooth" : "Turn On Bluetooth")
                    .padding()
       }
            
  Text("Bluetooth is \(bluetoothManager.isBluetoothEnabled ? "enabled" : "disabled")")
                .padding()

List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                Text(peripheral.name ?? "Unknown")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
