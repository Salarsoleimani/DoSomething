//
//  OnboardingController.swift
//  DoSomething
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import UIKit
import BEKListKit

class OnboardingController: UIViewController {
  // MARK:- Outlets
  @IBOutlet weak var onboardingCollectionView: BEKMultiCellCollection!
  // MARK:- Constants

  // MARK:- LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupCollectionView()
    bindData()
  }
  // MARK:- Actions

  // MARK:- Functions
  private func setupUI() {
    navigationController?.isNavigationBarHidden = true
    
    view.backgroundColor = DoSomethingColor.background.value
  }

  private func setupCollectionView() {
    let size = CGSize(width: StaticConstants.mainScreenWidth, height: StaticConstants.mainScreenHeight)
    onboardingCollectionView.isPagingEnabled = true
    onboardingCollectionView.collectionViewLayout = BEKCollectionLayoutComposer.makeLayout(ForItemSize: size, minimumLineSpacing:  8.0, minimumInteritemSpacing: 8.0, estimatedItemSize: .zero, scrollDirection: .horizontal)
  }
  
  private func bindData() {
    makeOnboardingModels().forEach { (item) in
      onboardingCollectionView.push(cell: BEKGenericCell.Collection<OnboardingCell>(viewModel: item))
    }
  }
  private func makeOnboardingModels() -> [OnboardingItemViewModel] {
    var models = [OnboardingItemViewModel]()
    for i in 1...2 {
      let element = OnboardingItemViewModel(title: "Onboarding_Title\(i)".localize(), description: "Onboarding_Description\(i)".localize(), image: UIImage(named: "\(i)") ?? UIImage())
      models.append(element)
    }
    return models
  }
}
