//
//  OptionStatusTransformer.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 10/1/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Cocoa

@objc(OptionStatusTransformer) class OptionStatusTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSColor.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let value = value as? Int else {
            return nil
        }
        
        switch value {
        case Option.OptionStatus.Error.rawValue:
            return NSColor.red
        case Option.OptionStatus.Unavailable.rawValue:
            return NSColor.gray
        case Option.OptionStatus.Success.rawValue:
            return NSColor.green
        case Option.OptionStatus.Warning.rawValue:
            return NSColor.yellow
        default:
            return NSColor.black
        }
    }
}
