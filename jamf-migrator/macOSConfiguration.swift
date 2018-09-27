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
    private var flag: Bool  = false //   This is set when a check is done.
    @objc var selectAll: Bool = true {
        willSet(newValue) {
            if self.flag { return }
            self.setAll(newValue)
        }
    }
    @objc var fileShares: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var directoryBindings: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var dockItems: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var computers: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var sus: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var netbootServers: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var extensionAttributes: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var scripts: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var printers: Bool = true {
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
    @objc var restrictedSoftware: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var configProfiles: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var packages: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var advCompSearches: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var configurations: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var policies: Bool = true {
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
    
    /**
     Checks if all the values are true or not, and updates it accordingly.
    */
    private func checkAll() -> Void {
        self.flag = true
        if (self.fileShares &&
            self.directoryBindings &&
            self.dockItems &&
            self.computers &&
            self.sus &&
            self.netbootServers &&
            self.extensionAttributes &&
            self.scripts &&
            self.printers &&
            self.smartGroups &&
            self.staticGroups &&
            self.restrictedSoftware &&
            self.configProfiles &&
            self.packages &&
            self.advCompSearches &&
            self.configurations &&
            self.policies) {
            self.updateKeyBinding("selectAll") {    self.selectAll = true  }
        } else {
            self.updateKeyBinding("selectAll") {    self.selectAll = false  }
        }
        self.flag = false
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
