//
//  iOSConfiguration.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 9/27/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Foundation

class iOSConfiguration: Configuration {
    
    //  Variables for Cocoa Bindings
    private var flag: Bool  = false //   This is set when a check is done.
    @objc var selectAll: Bool = true {
        willSet(newValue) {
            if self.flag { return }
            self.setAll(newValue)
        }
    }
    @objc var extensionAttributes: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var iOSDevices: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var smartGroups: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var staticGroups: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var adviOSSearches: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var configProfiles: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    
    //  MARK: Functions
    
    /**
     Sets all of the configuration options to the specified value.
     - Parameters:
     - value: This is the value that you will be setting all the configuration options to.
     */
    private func setAll(_ value: Bool) -> Void {
        self.updateKeyBinding("extensionAttributes") {  self.extensionAttributes = value }
        self.updateKeyBinding("iOSDevices") {   self.iOSDevices = value }
        self.updateKeyBinding("smartGroups") {  self.smartGroups = value    }
        self.updateKeyBinding("staticGroups") { self.staticGroups = value   }
        self.updateKeyBinding("adviOSSearches") { self.adviOSSearches = value   }
        self.updateKeyBinding("configProfiles") {   self.configProfiles = value }
    }
    
    /**
     Checks if all the values are true or not, and updates it accordingly.
     */
    private func checkAll() -> Void {
        self.flag = true
        if (self.extensionAttributes &&
            self.iOSDevices &&
            self.smartGroups &&
            self.staticGroups &&
            self.adviOSSearches &&
            self.configProfiles) {
            self.updateKeyBinding("selectAll") {    self.selectAll = true   }
        } else {
            self.updateKeyBinding("selectAll") {    self.selectAll = false  }
        }
        self.flag = false
    }
}
