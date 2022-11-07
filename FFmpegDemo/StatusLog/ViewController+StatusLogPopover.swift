//
//  ViewController+StatusLogPopover.swift
//  FFmpegDemo
//
//  Created by Justin Bush on 11/7/22.
//

import Cocoa

extension ViewController {
  
  /// Displays `statusLogPopover` to minY-position of object sender: `(?)`
  @IBAction func showStatusLogPopover(sender: NSButton) {
    if (statusLogPopover.isShown) {
      hidePopover(statusLogPopover)
    } else {
      let positioningView = sender
      let positioningRect = NSZeroRect
      let preferredEdge = NSRectEdge.minX//NSRectEdge.minY
      statusLogPopover.show(relativeTo: positioningRect, of: positioningView, preferredEdge: preferredEdge)
    }
  }
  /// Hide specific NSPopover object
  func hidePopover(_ popover: NSPopover) {
    if popover.isShown {
      popover.performClose(nil)
    }
  }
  
}
