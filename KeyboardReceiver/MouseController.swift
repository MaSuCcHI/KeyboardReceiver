//
//  MouseController.swift
//  KeyboardSender
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import AppKit

class MouseController: NSObject {
    
    
    override init() {
        super.init()
    }
    
    open func moveMouse(dx: Float,dy : Float){
        let dxf = CGFloat(dx)
        let dyf = CGFloat(dy)
        var location = NSEvent.mouseLocation
        for screen in NSScreen.screens {
            if screen.frame.contains(location) {
                location = CGPoint(x: location.x, y: NSHeight(screen.frame) - location.y)
                location = CGPoint(x: location.x + dxf, y: location.y + dyf)
                CGDisplayMoveCursorToPoint(0, location)
                break
            }
        }
    }
    
    open func leftClickDown() {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        var location = NSEvent.mouseLocation
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDown,
                            mouseCursorPosition: location, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    open func leftClickUp(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseUp,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    open func leftDragged(to: CGPoint, from: CGPoint) {
        leftClickDown()
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDragged,
                            mouseCursorPosition: to, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
        leftClickUp(position: to)
    }
    
}
