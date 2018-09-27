//
//  GeneralConfiguration.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 9/27/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Foundation

class GeneralConfiguration:Configuration {
    
    //  Variables for Cocoa Bindings
    private var flag: Bool  = false //   This is set when a check is done.
    @objc var selectAll: Bool = true {
        willSet(newValue) {
            if self.flag { return }
            self.setAll(newValue)
        }
    }
    @objc var sites: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var userEAs: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var LDAPServers: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var users: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var buildings: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var departments: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var categories: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var jamfUsers: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var jamfGroups: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var networkSegments: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var advUserSearches: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var smartUserGroups: Bool = true {
        didSet {
            self.checkAll()
        }
    }
    @objc var staticUserGroups: Bool = true {
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
        self.updateKeyBinding("sites") {    self.sites = value  }
        self.updateKeyBinding("userEAs") {  self.users = value  }
        self.updateKeyBinding("LDAPServers") { self.LDAPServers = value }
        self.updateKeyBinding("users") {    self.users = value  }
        self.updateKeyBinding("buildings") {    self.buildings = value  }
        self.updateKeyBinding("departments") {  self.departments = value    }
        self.updateKeyBinding("categories") {   self.categories = value }
        self.updateKeyBinding("jamfUsers") {    self.jamfUsers = value  }
        self.updateKeyBinding("jamfGroups") {   self.jamfGroups = value }
        self.updateKeyBinding("networkSegments") {  self.networkSegments = value    }
        self.updateKeyBinding("advUserSearches") {  self.advUserSearches = value    }
        self.updateKeyBinding("smartUserGroups") {  self.smartUserGroups = value    }
        self.updateKeyBinding("staticUserGroups") { self.staticUserGroups = value   }
        self.updateKeyBinding("userEAs") {  self.userEAs = value    }
    }
    
    /**
     Checks if all the values are true or not, and updates it accordingly.
     */
    private func checkAll() -> Void {
        self.flag = true
        if (self.sites &&
            self.userEAs &&
            self.LDAPServers &&
            self.users &&
            self.buildings &&
            self.departments &&
            self.categories &&
            self.jamfUsers &&
            self.jamfGroups &&
            self.networkSegments &&
            self.advUserSearches &&
            self.smartUserGroups &&
            self.staticUserGroups) {
            self.updateKeyBinding("selectAll") {    self.selectAll = true   }
        } else {
            self.updateKeyBinding("selectAll") {    self.selectAll = false  }
        }
        self.flag = false
    }
}
