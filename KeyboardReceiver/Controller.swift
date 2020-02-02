//
//  Controller.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
protocol ControllerDelegate {
    func manipulate(get data:Data)
}

class Controller: NSObject, ControllerDelegate{
    let mouse = MouseController()
    let keyboard = KeyboardController()
    override init() {
        
        super.init()
    }
    
    func manipulate(get data: Data) {
        let str = String(data: data, encoding: .utf8)
        let arry = str?.split(separator: ",")
        mouse.moveMouse(dx: (Float(arry![0])!), dy: Float(arry![1])!)
        return
    }
}
