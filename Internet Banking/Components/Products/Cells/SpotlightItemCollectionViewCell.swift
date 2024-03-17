//
//  SpotlightItemCollectionViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//
import UIKit

class SpotlightItemCollectionViewCell: UICollectionViewCell {
  static let indentifier = "SpotlightItemCollectionViewCell"
  
  let bannerImage: BannerImage = {
    let view = BannerImage(frame: .zero)
    view.image = UIImage(named: "placeholder")
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
    contentView.addSubview(bannerImage)
    
    NSLayoutConstraint.activate([
      bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      bannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configureData(spotlightItem: SpotlightItemEntity) {
    if let url = URL(string: spotlightItem.bannerURL) {
      bannerImage.load(url: url)
    }
  }
}
