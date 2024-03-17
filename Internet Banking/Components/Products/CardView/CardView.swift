//
//  CardView.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class CardView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureLayout()
  }
  
  func configureLayout() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 2
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = .zero
  }
}
