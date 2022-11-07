//
//  WindowController.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

class WindowController: NSWindowController {
  
  @IBOutlet weak var toggleSourceButton: NSToolbarItem!
  
  override func windowDidLoad() {
    super.windowDidLoad()
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
  }
  
  var isSourceExpanded = true
  @IBAction func toggleSourceButtonAction(_ sender: NSToolbarItem) {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    if isSourceExpanded {
      toggleSourceButton.image = NSImage(systemSymbolName: "chevron.down", accessibilityDescription: "Toggle Source")
      appDelegate.collapseSourceView()
      isSourceExpanded = false
    } else {
      toggleSourceButton.image = NSImage(systemSymbolName: "chevron.up", accessibilityDescription: "Toggle Source")
      appDelegate.expandSourceView()
      isSourceExpanded = true
    }
    
  }
  
}
