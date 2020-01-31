//
//  BTmanager.swift
//  KeyboardReceiver
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTmanager: NSObject {
    var manager: CBPeripheralManager
    open var controllerDeregate: ControllerDelegate?
    
    override init() {
        manager = CBPeripheralManager(delegate: nil, queue: nil)
        super.init()
        manager.delegate = self
    }

    private func setUPBT(){
        let service = CBMutableService(type: Const.Bluetooth.serviceUUID, primary: true)
        let properties : CBCharacteristicProperties = [.write,.writeWithoutResponse,.read]
        let permissions: CBAttributePermissions = [.readable,.writeable]
        let mouseCharacteristic = CBMutableCharacteristic(type: Const.Bluetooth.mouseUUID, properties: properties, value: nil, permissions: permissions)
        let keyboardCharacteristic = CBMutableCharacteristic(type: Const.Bluetooth.keyboardUUID, properties: properties, value: nil, permissions: permissions)
        
        service.characteristics = [mouseCharacteristic,keyboardCharacteristic]
        manager.add(service)
        
    }
    
}

extension BTmanager: CBPeripheralManagerDelegate{
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            setUPBT()
            let adDate = [CBAdvertisementDataServiceUUIDsKey: Const.Bluetooth.serviceUUID.uuidString
                ,CBAdvertisementDataLocalNameKey: "Controller"]
            peripheral.startAdvertising(adDate)
        default:
            print()
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        for request in requests {
            if request.characteristic.uuid == Const.Bluetooth.mouseUUID {
                let value = request.value
            } else if request.characteristic.uuid == Const.Bluetooth.keyboardUUID {
                
            }
        }
        manager.respond(to: requests[0], withResult: .success)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        print("add service")
    }
    
    
}
