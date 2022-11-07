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
  // Executable Source HUD Row
  @IBOutlet weak var verifyProgressIndicator: NSProgressIndicator!
  @IBOutlet weak var verifyStatusSymbolImageView: NSImageView!
  @IBOutlet weak var verifyExecutableButton: NSButton!
  @IBOutlet weak var statusLogButton: NSButton!
  @IBOutlet weak var sourceViewHeightConstraint: NSLayoutConstraint!
  
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
    initCommandLineView()
  }
  
  func collapseExecutableSourceView() {
    consoleTextView.enclosingScrollView?.contentInsets = NSEdgeInsets(top: 10, left: 10, bottom: 50, right: 6)
    sourceViewHeightConstraint.animator().constant = 0
    //consoleTextView.scrollToEndOfDocument(self)
  }
  
  func expandExecutableSourceView() {
    consoleTextView.enclosingScrollView?.contentInsets = NSEdgeInsets(top: 140, left: 10, bottom: 50, right: 6)
    sourceViewHeightConstraint.animator().constant = 134
    //consoleTextView.scrollToEndOfDocument(self)
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

