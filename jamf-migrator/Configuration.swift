//
//  Configuration.swift
//  jamf-migrator
//
//  Created by Tyler Morgan on 9/26/18.
//  Copyright © 2018 jamf. All rights reserved.
//

import Foundation

/**
 Basic configuration class that handles the selection of which items inside the JSS get copied.
 */
class Configuration: NSObject {
    /**
     Function to handle the process of updated a key binding in a clean way.
     - Parameters:
     - name: Name of the key you are changing.
     - callback: The function you are doing to update the key binding.
     */
    internal func updateKeyBinding(_ name: String, callback: () -> Void) {
        self.willChangeValue(forKey: name)
        callback()
        self.didChangeValue(forKey: name)
    }
}
