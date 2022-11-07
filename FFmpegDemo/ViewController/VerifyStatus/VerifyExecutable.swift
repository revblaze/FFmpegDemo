//
//  VerifyExecutable.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController {
  
  @IBAction func verifyButtonAction(_ sender: NSButton) {
    var path: String {
      let textField = executablePathTextField.stringValue
      if textField.isEmpty {
        return verifiedExecutablePath
      }
      return textField
    }
    
    verifyExecutable(atPath: path)
    
    print(Console.Std.all)
  }
  
  func updateExecutableStatus(_ consoleOutput: String) {
    StatusLog.stdOut = consoleOutput
    
    let status = getExecutableStatus(consoleOutput)
    endVerification(withStatus: status)
    addHeaderToConsole(consoleOutput, withStatus: status)
  }
  
  func verifyExecutable(atPath: String) {
    let path = atPath.fileURL.deletingLastPathComponent().path
    let executable = atPath.lastPathComponent
    let command = "cd \(path)\n./\(executable)"
    var consoleOutput = ""
    
    do {
      consoleOutput = try safeShell(command)
    }
    catch {
      print("\(error)")
      consoleOutput = String(describing: error)
    }
    
    updateExecutableStatus(consoleOutput)
  }
  
  func addHeaderToConsole(_ output: String, withStatus: VerifyStatus) {
    if withStatus == .valid && !Console.Std.headerHasBeenAdded {
      
      if Console.Settings.showEntireHeader {
        Console.Std.add(output)
      } else {
        
        let consoleComponents = output.components(separatedBy: "\n")
        
        for ent in consoleComponents {
          if ent.contains("ffmpeg version") || ent.contains("Use -h") {
            Console.Std.add("\(ent)\n")
          }
          if ent.contains("usage:") {
            Console.Std.add(ent)
          }
        }
      }
      
      Console.Std.headerHasBeenAdded = true
    }
  }
  
}
