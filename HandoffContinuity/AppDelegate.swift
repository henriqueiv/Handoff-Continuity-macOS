//
//  AppDelegate.swift
//  HandoffContinuity
//
//  Created by Henrique Valcanaia on 2/27/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func application(application: NSApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]) -> Void) -> Bool {
        switch NSApplication.sharedApplication().windows[0].contentViewController {
        case let viewController as ViewController:
            restorationHandler([viewController])
            
        default :
            print("do nothing")
            
        }
        
        return true
    }


}

