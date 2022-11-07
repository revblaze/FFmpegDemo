//
//  ConsoleTextView.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController: NSTextViewDelegate {
  
  func initConsoleTextView() {
    consoleTextView.delegate = self
    
    renderConsoleTextView()
    
    consoleTextView.enclosingScrollView?.contentInsets = NSEdgeInsets(top: 140, left: 10, bottom: 50, right: 6)
  }
  
  func renderConsoleTextView() {
    consoleTextView.font = .monospacedSystemFont(ofSize: 11, weight: .medium)
    consoleTextView.textColor = .textColor
  }
  
  func updateConsoleTextView() {
    let text = NSAttributedString(string: Console.Std.all)
    consoleTextView.textStorage?.setAttributedString(text)
    renderConsoleTextView()
    
    consoleTextView.scrollToEndOfDocument(self)
  }
  
}
