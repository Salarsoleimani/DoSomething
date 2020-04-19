//
//  MotivationModel.swift
//  Domain
//
//  Created by Salar Soleimani on 2020-04-18.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import Foundation
import SwiftLocalNotification

public struct MotivationModel {
  public let title: String
  public let description: String
  public let background: String
  public let notification: SwiftLocalNotificationModel

  public init(title: String, description: String, background: String, notification: SwiftLocalNotificationModel) {
    self.title = title
    self.description = description
    self.notification = notification
    self.background = background
  }
}
