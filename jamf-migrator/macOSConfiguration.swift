//
//  macOSConfiguration.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 9/26/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Foundation

/**
 Configuration class to handle configuration options specific to the macOS options in the JSS.
 */
class macOSConfiguration: Configuration {
    
    //  Variables for Cocoa Bindings
    @objc var selectAll: Bool = true {
        willSet(newValue) {
            self.setAll(newValue)
        }
    }
    @objc var fileShares: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var directoryBindings: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var dockItems: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var computers: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var sus: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var netbootServers: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var extensionAttributes: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var scripts: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var printers: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var smartGroups: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var staticGroups: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var restrictedSoftware: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var configProfiles: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var packages: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var advCompSearches: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var configurations: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    @objc var policies: Bool = true {
        willSet(newValue) {
            self.checkAll(newValue)
        }
    }
    
    
    //  MARK: Functions
    
    /**
     Sets all of the configuration options to the specified value.
     - Parameters:
        - value: This is the value that you will be setting all the configuration options to.
     */
    private func setAll(_ value: Bool) -> Void {
        self.updateKeyBinding("fileShares") { self.fileShares = value }
        self.updateKeyBinding("directoryBindings") { self.directoryBindings = value }
        self.updateKeyBinding("dockItems") { self.dockItems = value }
        self.updateKeyBinding("computers") { self.computers = value }
        self.updateKeyBinding("sus") { self.sus = value }
        self.updateKeyBinding("netbootServers") { self.netbootServers = value }
        self.updateKeyBinding("extensionAttributes") { self.extensionAttributes = value }
        self.updateKeyBinding("scripts") { self.scripts = value }
        self.updateKeyBinding("printers") { self.printers = value }
        self.updateKeyBinding("smartGroups") { self.smartGroups = value }
        self.updateKeyBinding("staticGroups") { self.staticGroups = value }
        self.updateKeyBinding("restrictedSoftware") { self.restrictedSoftware = value }
        self.updateKeyBinding("configProfiles") { self.configProfiles = value }
        self.updateKeyBinding("packages") { self.packages = value }
        self.updateKeyBinding("advCompSearches") { self.advCompSearches = value }
        self.updateKeyBinding("configurations") { self.configurations = value }
        self.updateKeyBinding("policies") { self.policies = value }
    }
    
    private func checkAll(_ value: Bool) -> Void {
        if (self.fileShares == value &&
            self.directoryBindings == value &&
            self.dockItems == value &&
            self.computers == value &&
            self.sus == value &&
            self.netbootServers == value &&
            self.extensionAttributes == value &&
            self.scripts == value &&
            self.printers == value &&
            self.smartGroups == value &&
            self.staticGroups == value &&
            self.restrictedSoftware == value &&
            self.configProfiles == value &&
            self.packages == value &&
            self.advCompSearches == value &&
            self.configurations == value &&
            self.policies) {
            self.selectAll = value
        }
    }
    
    /**
     Function to handle the process of updated a key binding in a clean way.
     - Parameters:
        - name: Name of the key you are changing.
        - callback: The function you are doing to update the key binding.
     */
    private func updateKeyBinding(_ name: String, callback: () -> Void) {
        self.willChangeValue(forKey: name)
        callback()
        self.didChangeValue(forKey: name)
    }
}
