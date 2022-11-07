//
//  PerformVerification.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController {
  
  func getExecutableStatus(_ consoleOutput: String) -> VerifyStatus {
    if executableIsValid(consoleOutput) {
      verifiedExecutablePath = executablePathTextField.stringValue
      return .valid
    } else {
      return .invalid
    }
  }
  
  // TODO: Improve via CLI interaction
  func executableIsValid(_ consoleOutput: String) -> Bool {
    if consoleOutput.contains("ffmpeg version") && consoleOutput.contains("--enable-")  {
      return true
    }
    return false
  }
  
  func startVerification() {
    verifyStatusSymbolImageView.isHidden = true
    verifyProgressIndicator.isHidden = false
    verifyProgressIndicator.startAnimation(self)
    
    verifyExecutableButton.isEnabled = false
  }
  
  func endVerification(withStatus: VerifyStatus = .unknown) {
    verifyStatusSymbolImageView.image = withStatus.symbol
    verifyStatusSymbolImageView.contentTintColor = withStatus.color
    
    verifyStatusSymbolImageView.isHidden = false
    verifyProgressIndicator.isHidden = true
    verifyProgressIndicator.stopAnimation(self)
    
    verifyExecutableButton.isEnabled = true
    statusLogButton.isEnabled = true
  }
  
}
