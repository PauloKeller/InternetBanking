//
//  BannerImage.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class BannerImage: UIImageView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureLayout()
  }
  
  func configureLayout() {
    self.layer.cornerRadius = 12
    self.layer.borderWidth = 1
    self.layer.masksToBounds = true;
    self.contentMode = .scaleAspectFill
  }
}
