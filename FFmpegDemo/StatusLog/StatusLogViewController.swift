//
//  StatusLogViewController.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

struct StatusLog {
  static var stdOut = ""
  static let permissionNotice = "\n\nAdjust directory permissions or try importing a static binary."
}

class StatusLogViewController: NSViewController {
  
  @IBOutlet weak var consoleOutput: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    consoleOutput.font = .monospacedSystemFont(ofSize: 11, weight: .medium)
    consoleOutput.stringValue = ""
  }
  
  override func viewDidAppear() {
    var stdOut: String {
      if StatusLog.stdOut.contains("operation not permitted: ./ffmpeg") {
        return StatusLog.stdOut.appending(StatusLog.permissionNotice)
      }
      return StatusLog.stdOut
    }
    
    consoleOutput.stringValue = stdOut
  }
  
  override func viewDidDisappear() {
    consoleOutput.stringValue = ""
  }
  
}
