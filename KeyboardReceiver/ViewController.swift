//
//  ViewController.swift
//  KeyboardReceiver
//
//  Created by KEISUKE MASUDA on 2020/01/31.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let controller = Controller()
    var connection: Connection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connection = Connection()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

