//
//  ViewController.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

class ViewController: NSViewController, NSPopoverDelegate, NSTextFieldDelegate {
  
  // Executable Location Box
  @IBOutlet weak var executablePathTextField: NSTextField!
  // Executable Action HUD Row
  @IBOutlet weak var verifyProgressIndicator: NSProgressIndicator!
  @IBOutlet weak var verifyStatusSymbolImageView: NSImageView!
  @IBOutlet weak var verifyExecutableButton: NSButton!
  @IBOutlet weak var statusLogButton: NSButton!
  
  var verifiedExecutablePath = "/usr/local/bin/ffmpeg"
  
  // Console View
  @IBOutlet weak var consoleTextView: NSTextView!
  // CommandLine View
  @IBOutlet weak var commandPrefexTextField: NSTextField!
  @IBOutlet weak var inputFileTextField: NSTextField!
  @IBOutlet weak var commandArgumentsTextField: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initConsoleTextView()
    
    //commandPrefexTextField.delegate = self
    
    initCommandLineView()
  }
  
  @IBAction func inputFileBrowserButtonAction(_ sender: NSButton) {
    openMediaFileBrowser()
  }
  
  @IBAction func runShellCommand(_ sender: NSButton) {
    
  }
  
  func initCommandLineView() {
    commandPrefexTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    inputFileTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    commandArgumentsTextField.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
    
    inputFileTextField.alphaValue = 0.3
  }
  
  struct CommandLine {
    static var inputFilePath = ""
    
    static var arguments = ""
    
    static func getCleanFileName(_ forPath: String) -> String {
      inputFilePath = forPath
      return forPath.lastPathComponent
    }
    
  }
  
  func setInputFileText(atPath: String) {
    let text = CommandLine.getCleanFileName(atPath)
    inputFileTextField.stringValue = text
    inputFileTextField.alphaValue = 1.0
  }
  
  
  

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
  

  // MARK: - Popovers
  /// Initialize popover to call `StatusLogViewController`
  lazy var statusLogPopover: NSPopover = {
    let popover = NSPopover()
    popover.behavior = .semitransient
    popover.contentViewController = StatusLogViewController()
    popover.delegate = self
    popover.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
    return popover
  }()

}

