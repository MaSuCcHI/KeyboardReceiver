//
//  Controller.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
protocol ControllerDelegate {
}

class Controller: NSObject, ControllerDelegate{
    let mouse = MouseController()
    let keyboard = KeyboardController()
    override init() {
        
        super.init()
    }
}
