//
//  testScreenSaverNibLoadView.swift
//  testScreenSaverNibLoad
//
//  Created by shimaguchi on 2020/04/25.
//  Copyright © 2020 junshimag. All rights reserved.
//

import Foundation
import ScreenSaver
import Cocoa

class testScreenSaverNibLoadView: ScreenSaverView {

    var textField:NSTextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.wantsLayer = true
        self.addSubview(self.loadNib())
    }
    
    func loadNib() -> NSView {
        var topLevelObjects : NSArray?

        
        if let newNib = NSNib(nibNamed: "TestView", bundle: Bundle(for: type(of: self))) {
            
            newNib.instantiate(withOwner: self, topLevelObjects: &topLevelObjects)
            let newView =  (topLevelObjects!.first(where: { $0 is NSView }) as? NSView)!
            newView.frame = self.frame
            newView.wantsLayer = true
            newView.layer?.backgroundColor = NSColor.blue.cgColor
            textField = newView.viewWithTag(1) as? NSTextField
            return newView
        }
        let oldView = NSView.init(frame: self.frame)
        oldView.wantsLayer = true
        oldView.layer?.backgroundColor = NSColor.green.cgColor
        return oldView
    }

    override func startAnimation() {
        super.startAnimation()
    }
    override func stopAnimation() {
        super.stopAnimation()
    }

    override func draw(_ rect: NSRect) {
    }

    override func animateOneFrame() {
        super.animateOneFrame()
        
        if textField != nil {
            textField.stringValue = "animateOneFrame"
        }
    }
}
