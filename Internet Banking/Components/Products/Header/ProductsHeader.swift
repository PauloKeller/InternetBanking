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
    view.alignment = .fill
    view.spacing = 12
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Place text here"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "placeholder")
    view.contentMode = .scaleAspectFit
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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
    
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      imageView.widthAnchor.constraint(equalToConstant: 45),
    ])

    NSLayoutConstraint.activate([
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  func configureData(title: String, image: UIImage) {
    self.titleLabel.text = title
    self.imageView.image = image
  }
}
