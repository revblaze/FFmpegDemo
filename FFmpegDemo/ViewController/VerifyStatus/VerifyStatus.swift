//
//  VerifyStatus.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

enum VerifyStatus {
  case unknown, valid, invalid
  
  var symbol: NSImage {
    switch self {
    case .unknown: return NSImage(systemSymbolName: "questionmark.circle", accessibilityDescription: "Unknown")!
    case .valid: return NSImage(systemSymbolName: "checkmark.circle.fill", accessibilityDescription: "Valid")!
    case .invalid: return NSImage(systemSymbolName: "multiply.circle.fill", accessibilityDescription: "Invalid")!
    }
  }
  
  var color: NSColor {
    switch self {
    case .unknown: return .systemGray
    case .valid: return .systemGreen
    case .invalid: return .systemRed
    }
  }
}
