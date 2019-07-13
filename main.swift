import IOBluetooth
import Foundation


func pairDevice(byName deviceName: String) {
    guard let devices = IOBluetoothDevice.pairedDevices() else {
        print("No devices.")
        return
    }
    if (devices.count == 0) {
        print("No devices.")
        return
    }
    for item in devices {
        if let device = item as? IOBluetoothDevice {
            if device.name == deviceName {
                let status = device.openConnection()
                if(status == 0){
                    print("Connected \(device.name ?? "")")
                } else {
                    print("Connecting to \(device.name ?? "") failed")
                }
                return
            }
        }
    }
    print("Didn't find device with given name: \(deviceName)")
}

let deviceName: String
if CommandLine.arguments.count >= 2 {
    deviceName = CommandLine.arguments[1]
} else {
    deviceName = "Paul’s AirPods"
}

pairDevice(byName: deviceName)
