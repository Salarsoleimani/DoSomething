//
//  DoSomethingColor.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import UIKit

enum DoSomethingColor {
  case background
  case text
  
  case lightGray
  case lightGreen
  case yellow
  case lightRed
  case darkRed
  case lightPurple
  
  case custom(hexString: String, alpha: Double)
  case customWithDarkModeString(hexStringForDarkMode: String, hexStringForLightMode: String, alpha: Double)
  case customWithDarkModeColor(colorForDarkMode: UIColor, colorForLightMode: UIColor, alpha: Double)
  
  func withAlpha(_ alpha: Double) -> UIColor {
    return self.value.withAlphaComponent(CGFloat(alpha))
  }
}

extension DoSomethingColor {
  
  var value: UIColor {
    var instanceColor = UIColor.clear
    
    switch self {
    case .background:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hexString: "#28272C"), lightModeColor: UIColor.white)
    case .text:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hexString: "#ececec"), lightModeColor: UIColor(hexString: "#9B9B9B"))
    case .lightGray:
      instanceColor = UIColor(hexString: "3C3C42")
      
    case .lightGreen:
      instanceColor = UIColor(hexString: "43CF71")
    case .yellow:
      instanceColor = UIColor(hexString: "FBBD42")
    case.darkRed:
      instanceColor = UIColor(hexString: "C30A0D")
    case .lightRed:
      instanceColor = UIColor(hexString: "F6474A")
    case .lightPurple:
      instanceColor = UIColor(hexString: "816CFF")
      
    case .custom(let hexString, let opacity):
      instanceColor = UIColor(hexString: hexString).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeString(let hexStringForDarkMode, let hexStringForLightMode, let opacity):
      instanceColor = UIColor.UITraitCollectionColor(darkModeHexString: hexStringForDarkMode, lightModeHexString: hexStringForLightMode).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeColor(let colorForDarkMode, let colorForLightMode, let opacity):
      UIColor.UITraitCollectionColor(darkModeColor: colorForDarkMode, lightModeColor: colorForLightMode).withAlphaComponent(CGFloat(opacity))
    }
    return instanceColor
  }
}

