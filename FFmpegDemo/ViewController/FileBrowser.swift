//
//  FileBrowser.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController {
  
  @IBAction func browseForExecutableFile(_ sender: NSButton) {
    openExecutableFileBrowser()
  }
  
  func updateExecutablePath(_ path: String) {
    executablePathTextField.stringValue = path
    verifyExecutable(atPath: path)
  }
  
  func openExecutableFileBrowser() {
    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = false
    openPanel.canCreateDirectories = false
    openPanel.canChooseFiles = true
    
    let response = openPanel.runModal()
    if response == .OK {
      let path = openPanel.url?.path
      updateExecutablePath(path!)
    }
  }
  
  func openMediaFileBrowser() {
    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = false
    openPanel.canCreateDirectories = false
    openPanel.canChooseFiles = true
    
    let response = openPanel.runModal()
    if response == .OK {
      let path = openPanel.url?.path
      setInputFileText(atPath: path!)
    }
  }
  
}



extension String {
  /// Returns a URL that references the local file or directory at path. Mostly used for String-URL interpolation within other String extensions (see String+Extensions.swift).
  var fileURL: URL {
    return URL(fileURLWithPath: self)
  }
  /// Returns the *lowercased* path extension of a String.
  ///
  /// ```
  /// let fileUrl = "path/to/video.MP4"
  /// fileUrl.pathExtension // "mp4"
  /// ```
  var pathExtension: String {
    return fileURL.pathExtension.lowercased()
  }
  /// Returns the last path component of a String.
  ///
  /// ```
  /// let fileUrl = "path/to/video.mp4"
  /// fileUrl.lastPathComponent // "video.mp4"
  /// ```
  var lastPathComponent: String {
    return fileURL.lastPathComponent
  }
}

