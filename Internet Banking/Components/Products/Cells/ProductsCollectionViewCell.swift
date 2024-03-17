//
//  ProductsCollectionViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
  static let identifier = "ProductsCollectionViewCell"
  
  let cardView: CardView = {
    let view = CardView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let containerView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 20
    view.layer.masksToBounds = true;
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    configureCell()
  }
  
  private func configureCell() {
    contentView.addSubview(cardView)
    
    cardView.addSubview(containerView)
    containerView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
      cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
      containerView.topAnchor.constraint(equalTo: cardView.topAnchor),
      containerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 90),
      imageView.widthAnchor.constraint(equalToConstant: 90),
    ])
  }
  
  func configureData(item: ProductItemEntity) {
    if let url = URL(string: item.imageURL) {
      imageView.load(url: url)
    }
  }
}
