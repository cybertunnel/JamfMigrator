//
//  Option.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 10/1/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Foundation

class Option: NSObject {
    
    
    //  MARK: Enums
    
    @objc enum OptionStatus: Int {
        case Unknown, Unavailable, Error, Warning, Success
    }
    
    //  MARK: Variables
    @objc let name: String
    @objc var status: OptionStatus = .Unknown {
        willSet {
            self.willChangeValue(forKey: "status")
        }
        didSet {
            self.didChangeValue(forKey: "status")
        }
    }
    
    init(withName name: String) {
        self.name = name
        return
    }
}
