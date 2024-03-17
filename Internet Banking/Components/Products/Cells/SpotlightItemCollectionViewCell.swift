//
//  SpotlightItemCollectionViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//
import UIKit

class SpotlightItemCollectionViewCell: UICollectionViewCell {
  static let identifier = "SpotlightItemCollectionViewCell"
  
  let cardView: CardView = {
    let view = CardView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "placeholder")
    view.layer.shadowRadius = 4
    view.layer.cornerRadius = 12
    view.layer.masksToBounds = true;
    view.contentMode = .scaleAspectFill
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
    
    cardView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
      cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      imageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
      imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
      imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
    ])
  }
  
  func configureData(item: SpotlightItemEntity) {
    if let url = URL(string: item.bannerURL) {
      imageView.load(url: url)
    }
  }
}
