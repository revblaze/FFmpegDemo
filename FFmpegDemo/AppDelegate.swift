//
//  AppDelegate.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  
  var mainWindow: NSWindow!
  
  /// Called upon initial application launch
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    /// Set mainWindow as initial window presented
    mainWindow = NSApplication.shared.windows[0]
    NSApp.activate(ignoringOtherApps: true)
  }
  
  /// Called upon request to reactivate NSApp from an inactive state (ie. clicking the app from the dock)
  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    /// If the app has no visible windows, present `mainWindow`
    if !flag {
      mainWindow.makeKeyAndOrderFront(self)
    }
    return true
  }
  
  /// Presents mainWindow ViewController as key window, then calls `messageDidSentAlert()`
  func updateConsole() {
    mainWindow.makeKeyAndOrderFront(self)
    let viewController = mainWindow.contentViewController as? ViewController
    viewController?.updateConsoleTextView()
  }
  
  func collapseSourceView() {
    mainWindow.makeKeyAndOrderFront(self)
    let viewController = mainWindow.contentViewController as? ViewController
    viewController?.collapseExecutableSourceView()
  }
  
  func expandSourceView() {
    mainWindow.makeKeyAndOrderFront(self)
    let viewController = mainWindow.contentViewController as? ViewController
    viewController?.expandExecutableSourceView()
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
  
  
}

