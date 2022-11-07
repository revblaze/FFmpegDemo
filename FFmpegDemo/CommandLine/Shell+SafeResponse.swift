//
//  Shell+SafeResponse.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Foundation

extension ViewController {
  
  @discardableResult // Add to suppress warnings when you don't want/need a result
  func safeShell(_ command: String) throws -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.executableURL = URL(fileURLWithPath: "/bin/zsh")
    task.standardInput = nil
    
    try task.run()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
  }
  
}
