//
//  CommandLineRow.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController {
  
  @IBAction func inputFileBrowserButtonAction(_ sender: NSButton) {
    openMediaFileBrowser()
  }
  
  @IBAction func runShell(_ sender: NSButton) {
    let arguments = commandArgumentsTextField.stringValue
    
    let command = CommandLineBuilder.build(arguments: arguments)
    let prettyCommand = CommandLineBuilder.buildPretty(arguments: arguments)
    print("\(prettyCommand)\n\n\(command)")
    
    var out = ""
    do {
      out = try safeShell(command)
    }
    catch {
      print("\(error)")
      //consoleOutput = String(describing: error)
    }
    print(out)
  }
  
  func initCommandLineView() {
    commandPrefexTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    inputFileTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    commandArgumentsTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    
    inputFileTextField.alphaValue = 0.3
  }
  
  
  func setInputFileText(atPath: String) {
    let text = CommandLineBuilder.getCleanFileName(atPath)
    inputFileTextField.stringValue = text
    inputFileTextField.alphaValue = 1.0
  }
  
}
