//
//  HomeNavigator.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-18.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import Foundation

final class HomeNavigator: Navigator {
  func setup() {
    let vc = HomeController.initFromNib()
    navigationController.viewControllers = [vc]
    //AnalyticLogProvider.logNavigator(name: NSStringFromClass(type(of: self)), functionName: "setup")
  }
}
