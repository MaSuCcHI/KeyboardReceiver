//
//  KeyboardController.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import AppKit

class KeyboardController: NSObject {
    
    override init() {
        super.init()
    }
    
    func keyDown(key: CGKeyCode) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: true)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    func keyUp(key: CGKeyCode) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: false)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    func keyDown(key: CGKeyCode, with: CGEventFlags) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: true)
        event?.flags = with
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    func keyUp(key: CGKeyCode, with: CGEventFlags) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: false)
        event?.flags = with
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    
    
}
