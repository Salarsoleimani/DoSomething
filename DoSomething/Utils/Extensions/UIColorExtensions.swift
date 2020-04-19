//
//  UIColorExtensions.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit

extension UIColor {
  /**
   Creates an UIColor from HEX String in "#363636" format
   
   - parameter hexString: HEX String in "#363636" format
   
   - returns: UIColor from HexString
   */
  convenience init(hexString: String) {
    
    let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
    let scanner = Scanner(string: hexString as String)
    
    if hexString.hasPrefix("#") {
      scanner.scanLocation = 1
    }
    
    var color: UInt32 = 0
    scanner.scanHexInt32(&color)
    
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    
    self.init(red:red, green:green, blue:blue, alpha:1)
  }
  
  static func UITraitCollectionColor(darkModeHexString: String, lightModeHexString: String) -> UIColor {
    let darkModeColor = UIColor(hexString: darkModeHexString)
    let lightModeColor = UIColor(hexString: lightModeHexString)
    if #available(iOS 13, *) {
      return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
        if UITraitCollection.userInterfaceStyle == .dark {
          /// Return the color for Dark Mode
          return darkModeColor
        } else {
          /// Return the color for Light Mode
          return lightModeColor
        }
      }
    } else {
      /// Return a fallback color for iOS 12 and lower.
      return darkModeColor
    }
  }
  static func UITraitCollectionColor(darkModeColor: UIColor, lightModeColor: UIColor) -> UIColor {
    if #available(iOS 13, *) {
      return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
        if UITraitCollection.userInterfaceStyle == .dark {
          /// Return the color for Dark Mode
          return darkModeColor
        } else {
          /// Return the color for Light Mode
          return lightModeColor
        }
      }
    } else {
      /// Return a fallback color for iOS 12 and lower.
      return darkModeColor
    }
  }
}
