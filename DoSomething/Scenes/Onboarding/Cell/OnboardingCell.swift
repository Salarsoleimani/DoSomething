//
//  OnboardingCell.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-18.
//  Copyright © 2020 Salar Soleimani. All rights reserved.
//

import UIKit
import BEKListKit

class OnboardingCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  var viewModel: OnboardingItemViewModel!

  override func awakeFromNib() {
    super.awakeFromNib()

  }
}
extension OnboardingCell: BEKBindableCell {
  typealias ViewModeltype = OnboardingItemViewModel
  func bindData(withViewModel viewModel: OnboardingItemViewModel) {
    self.viewModel = viewModel
    imageView.image = viewModel.image
    titleLabel.text = viewModel.title
    descriptionLabel.text = viewModel.description
  }
}
