//
//  Console.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

struct Console {
  
  struct Settings {
    // Full FFheader or shortened format
    static let showEntireHeader = true
  }
  
  struct Std {
    // Flags
    static var headerHasBeenAdded = false
    
    static var all = ""
    
    static func add(_ output: String) {
      all.append(output)
      all.append("\n")
      
      let appDelegate = NSApplication.shared.delegate as! AppDelegate
      appDelegate.updateConsole()
    }
    
  }
  
}
