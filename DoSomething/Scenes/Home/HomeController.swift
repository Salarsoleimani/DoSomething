//
//  HomeController.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-02.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import UIKit
import HGCircularSlider
import SwiftLocalNotification
import AVFoundation
import GoogleMobileAds
import AnalyticPlatform
import SwiftLocalNotification
import Domain

class HomeController: UIViewController {
  // MARK:- Constants
  // MARK:- Variables
  var rewardedAd: GADRewardedAd?
  // MARK:- Outlets
  @IBOutlet weak var circularSlider: CircularSlider!
  @IBOutlet weak var notificationSlider: UISlider!

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var notificationButton: UIButton!
  
  @IBOutlet weak var numberOfNotificationsLabel: UILabel!

  // MARK:- Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGoogleAd()
  }

  // MARK:- Functions
  private func setupGoogleAd() {
    addBannerViewToView(createAndLoadBanner(adBannerHomeBottom, forViewController: self))
    rewardedAd = createAndLoadRewardedAd(adRewardedHome)
  }
    // MARK:- Actions

  
//  static func getSampleModels() -> [MotivationModel] {
//    return [MotivationModel(title: <#T##String#>, description: <#T##String#>, background: , notification: SwiftLocalNotificationModel(title: <#T##String#>, body: <#T##String#>, date: <#T##Date#>, repeating: <#T##RepeatingInterval#>)),
//    ]
//  }
  private func setNotifications() {
    let titles = ["Come on...","Tick tock...","Stand up...","Do something...","Time flies...","Please do something...","Don't waste it...","Do something...","Please...","Keep in mind..."]
    let bodys = ["No matter how many mistakes you make or how slow you progress, you are still way ahead of everyone who isn't trying.","Most of the important things in the world have been accomplished by people who have kept on trying when there seemed to be no hope at all.","learn from yesterday, live for today, hope for tomorrow. the important thing is not to stop questioning and do something now.","Every seconds is going and you are still waiting for somwthing or someone. Stand up and make your tomorrow.","All things are difficult before they are easy.","Do, just do... It can get you through anything.","Wake up. It is you day today.", "The struggle your are in today is developing the strength you need tomorrow.", "Don't talk, just act. Don't say, just show. Don't promise, just prove.", "Don't waste your time looking back on what you've lost. Move on, for life is not meant to be traveled backwards.", "What you want exists. Don't settle until you get it."]
    
  }
  
  
  private func openAboutUs(_ sender: UIButton) {
    let alertController = UIAlertController(title: "About Us", message: "Do something is an app makes you motivated by daily notifications that you choose to how many it whould be. It can grow up the way you want if you support us.", preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
    alertController.addAction(cancelAction)
    if let popoverController = alertController.popoverPresentationController {
      popoverController.sourceView = sender
      popoverController.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
    }
    present(alertController, animated: true, completion: nil)
  }
}
extension HomeController: GADRewardedAdDelegate {
  func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
    AppAnalytics.shared.countUpRewardAd()
  }
  func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
    self.rewardedAd = createAndLoadRewardedAd(adRewardedHome)
  }
}
