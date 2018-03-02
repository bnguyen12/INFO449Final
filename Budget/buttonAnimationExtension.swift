//
//  buttonAnimationExtension.swift
//  Budget
//
//  Created by Benny Nguyen on 3/1/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
  
  //Make button flash
  func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.2
    flash.fromValue = 1
    flash.toValue = 0.5
    flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 1
    layer.add(flash, forKey: nil)
  }
  
  //Make button shake
  func shake() {
    let shake = CABasicAnimation(keyPath: "position")
    shake.duration = 0.1
    shake.repeatCount = 1
    shake.autoreverses = true
    
    let fromPoint = CGPoint(x: center.x - 5, y: center.y)
    let fromValue = NSValue(cgPoint: fromPoint)
    
    let toPoint = CGPoint(x: center.x + 5, y: center.y)
    let toValue = NSValue(cgPoint: toPoint)
    
    shake.fromValue = fromValue
    shake.toValue = toValue
    
    layer.add(shake, forKey: "position")
  }
}
