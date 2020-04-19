//
//  AppAnalytics.swift
//  VirusCase
//
//  Created by Salar Soleimani on 2020-02-28.
//  Copyright © 2020 BEKApps. All rights reserved.
//

import Firebase
import Foundation
import UIKit
import FirebaseCrashlytics
import FCUUID

enum Constants {
  enum Keys: String {
    case watchedRewardAd = "com.storageKey.watchedRewardAd"
    case watchedRewardAdInQuestion = "com.storageKey.watchedRewardAdInQuestion"
    case removeAds = "com.storageKey.removeAds"
    case isOnboardingWatched = "com.storageKey.isOnboardingWatched"
    case appOpenedCount = "com.storageKey.appOpenedCount"
    case userFullName = "com.storageKey.userFullName"
  }
}
struct StaticConstants {
  static let appOpenedCount: Int = UserDefaults.standard.integer(forKey: Constants.Keys.appOpenedCount.rawValue)
  static let watchedRewardedAdCount: Int = UserDefaults.standard.integer(forKey: Constants.Keys.watchedRewardAd.rawValue)
  static let watchedRewardedAdInQuestionCount: Int = UserDefaults.standard.integer(forKey: Constants.Keys.watchedRewardAdInQuestion.rawValue)
  static let isAdsRemoved: Bool = UserDefaults.standard.bool(forKey: Constants.Keys.removeAds.rawValue)
  static let isOnboardingWatched: Bool = UserDefaults.standard.bool(forKey: Constants.Keys.isOnboardingWatched.rawValue)
}

final public class AppAnalytics {
  public static let shared = AppAnalytics()
  
  public func setup() {
		
		FirebaseApp.configure()
		
    Crashlytics.crashlytics().setUserID("\(FCUUID.uuidForDevice() ?? "")")
    setAppOpenedCount()
  }
  
  public func setAppOpenedCount() {
    let key = Constants.Keys.appOpenedCount.rawValue
    if StaticConstants.appOpenedCount > 0 {
      UserDefaults.standard.set(StaticConstants.appOpenedCount + 1, forKey: key)
      return
    }
    UserDefaults.standard.set(1, forKey: key)
  }
  public func countUpRewardAd() {
    let key = Constants.Keys.watchedRewardAd.rawValue
    UserDefaults.standard.set(StaticConstants.watchedRewardedAdCount + 1, forKey: key)
  }
  public func countUpRewardAdInQuestion() {
    let key = Constants.Keys.watchedRewardAdInQuestion.rawValue
    UserDefaults.standard.set(StaticConstants.watchedRewardedAdInQuestionCount + 1, forKey: key)
  }
  public func adsRemoved() {
    let key = Constants.Keys.removeAds.rawValue
    UserDefaults.standard.set(true, forKey: key)
  }
  public func setOboardingWatched() {
    let key = Constants.Keys.isOnboardingWatched.rawValue
    UserDefaults.standard.set(true, forKey: key)
  }
  // Analytics
  public func log(eventName: String, parameters: [String: Any]?) {
    Analytics.logEvent(eventName, parameters: parameters)
  }
  
  // Crashlytics
  public func logCrash(_ withMessage: String) {
    Crashlytics.crashlytics().log(withMessage)
  }
  public func logCrash(_ arg: [CVarArg], format: String) {
    Crashlytics.crashlytics().log(format: format, arguments: getVaList(arg))
  }
  public func logCrash(_ customValue: Any, forKey: String) {
    Crashlytics.crashlytics().setCustomValue(customValue, forKey: forKey)
  }
  public func logCrash(_ withError: Error) {
    Crashlytics.crashlytics().record(error: withError)
  }
}
