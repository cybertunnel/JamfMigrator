//
//  AppDelegate.swift
//  jamf-migrator
//
//  Created by Leslie N. Helou on 12/9/16.
//  Copyright © 2016 jamf. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    //  MARK: Functions
    
    /**
    Creates an alert dialog with a title, message, and if an update is available.
     - Parameters:
        - header: The title of the message being displayed to the user.
        - message: The message that will be displayed to the user.
        - updateAvail: If set to true, will display the update alert, otherwise displays a normal alert window.
    */
    func alert_dialog(header: String, message: String, updateAvail: Bool) {
        let dialog: NSAlert = NSAlert()
        dialog.messageText = header
        dialog.informativeText = message
        dialog.alertStyle = NSAlert.Style.informational
        if updateAvail {
            dialog.addButton(withTitle: "View")
            dialog.addButton(withTitle: "Ignore")
        } else {
            dialog.addButton(withTitle: "OK")
        }
        
        let clicked:NSApplication.ModalResponse = dialog.runModal()

        if clicked.rawValue == 1000 && updateAvail {
            if let url = URL(string: "https://github.com/jamfprofessionalservices/JamfMigrator/releases") {
                    NSWorkspace.shared.open(url)
            }
        }

        //return true
    }   // func alert_dialog - end
    
    //  MARK: IBAction
    @IBAction func checkForUpdates(_ sender: AnyObject) {
        let verCheck = VersionCheck()
        
        let appInfo = Bundle.main.infoDictionary!
        let version = appInfo["CFBundleShortVersionString"] as! String
        
        verCheck.versionCheck() {
            (result: Bool) in
            //            print("AppDelegate update avail: \(result)")
            if result {
                self.alert_dialog(header: "Running Jamf Migrator: \(version)", message: "A new versions is available.", updateAvail: result)
            } else {
                self.alert_dialog(header: "Running Jamf Migrator: \(version)", message: "No updates are currently available.", updateAvail: result)
            }
        }
    }
}

