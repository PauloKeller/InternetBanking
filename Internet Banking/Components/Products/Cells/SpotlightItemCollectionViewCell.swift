//
//  SpotlightItemCollectionViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//
import UIKit

class SpotlightItemCollectionViewCell: UICollectionViewCell {
  static let indentifier = "SpotlightItemCollectionViewCell"
  
  let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "placeholder")
    view.contentMode = .scaleAspectFit
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
    contentView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configureData(spotlightItem: SpotlightItemEntity) {
    if let url = URL(string: spotlightItem.bannerURL) {
      imageView.load(url: url)
    }
  }
}
