//
//  AppDelegate.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-01.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import UIKit
import AVFoundation
import Siren
import SwiftRater
import GoogleMobileAds
import AnalyticPlatform

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    setupApplication()
    return true
  }
  
  private func setupApplication() {
    Application.shared.configureMainInterface(in: window)
    Application.shared.setupApplicationConfigurations()
  }
}

