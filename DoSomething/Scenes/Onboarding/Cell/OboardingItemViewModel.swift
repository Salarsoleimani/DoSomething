//
//  OboardingItemViewModel.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-18.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import UIKit

struct OnboardingItemViewModel{
  let title: String
  let image: UIImage
  let description: String
  init(title: String, description: String, image: UIImage) {
    self.title = title
    self.description = description
    self.image = image
  }
}
struct OnboardingMockModel: Codable {
  let title: String
  let imageName: String
  let description: String
}
extension OnboardingMockModel {
  func asOnboardingItemViewModel() -> OnboardingItemViewModel {
    return OnboardingItemViewModel(title: title, description: description, image: UIImage(named: imageName) ?? UIImage())
  }
}
