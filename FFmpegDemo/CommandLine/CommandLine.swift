//
//  CommandLine.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Foundation

struct CommandLineBuilder {
  static var executablePath = ""
  static var inputFilePath = ""
  static var showInFinderPath = ""
  
  static func getCleanFileName(_ forPath: String) -> String {
    inputFilePath = forPath
    return forPath.lastPathComponent
  }
  
  static func buildPretty(arguments: String) -> String {
    return "ffmpeg -i \(inputFilePath.lastPathComponent) \(arguments)"
  }
  
  static func build(arguments: String) -> String {
    var argsArray = arguments.components(separatedBy: " ")
    let outputPath = argsArray.last
    argsArray.removeLast()
    let args = argsArray.joined(separator: " ")
    let downloadsPath = "~/Downloads/\(outputPath!)"
    showInFinderPath = downloadsPath
    
    return "cd /\n.\(executablePath) -i \"\(inputFilePath)\" \(args) \(downloadsPath)"
  }
  
}

