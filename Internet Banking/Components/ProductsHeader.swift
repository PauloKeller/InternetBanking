//
//  ProductsHeader.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

final class ProductsHeader: UIView {
  
  let stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
    view.alignment = .leading
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Place text here"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureLayout()
  }
  
  func configureLayout() {
    self.addSubview(stackView)
    stackView.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
