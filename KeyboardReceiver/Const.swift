//
//  Const.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

struct Const {
    struct Bluetooth {
        static let serviceUUID = CBUUID(string: "AD72452C-36C7-4749-82AB-459118913481")
        static let mouseUUID = CBUUID(string: "A96AB098-1A58-4DE7-996E-6F457E90FBA9")
        static let keyboardUUID = CBUUID(string: "6CA59F2E-8E32-4E40-9F14-EF0CB61B81CE")
    }
}
