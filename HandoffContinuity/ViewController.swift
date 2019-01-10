//
//  ViewController.swift
//  HandoffContinuity
//
//  Created by Henrique Valcanaia on 2/27/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var titleTextField: NSTextField!
    @IBOutlet var contentTextView: NSTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        createUserActivity()
    }
    
    private func createUserActivity(){
        let userActivity = NSUserActivity(activityType: "xyz.henriquevalcanaia.HandoffContinuity.notes.edit")
        userActivity.title = "Title"
        userActivity.addUserInfoEntriesFromDictionary(["title":titleTextField.stringValue, "content":contentTextView.string!])
        self.userActivity = userActivity;
        self.userActivity?.becomeCurrent()
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func updateUserActivityState(userActivity: NSUserActivity) {
        userActivity.title = "Title"
        userActivity.addUserInfoEntriesFromDictionary(["title":titleTextField.stringValue, "content":contentTextView.string!])
    }
    
    deinit {
        self.userActivity?.invalidate()
    }
    
    override func restoreUserActivityState(userActivity: NSUserActivity) {
        if let userInfo:[NSObject:AnyObject] = userActivity.userInfo{
            titleTextField.stringValue = (userInfo["title"] as? String)!
            contentTextView.string = userInfo["content"] as? String
        }
    }
    
}

