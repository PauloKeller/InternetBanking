//
//  CenterBannerTableViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class CenterBannerTableViewCell: UITableViewCell {
  static let identifier = "CenterBannerTableViewCell"
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "digio Cash"
    label.font = .boldSystemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let cardView: CardView = {
    let view = CardView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let bannerImage: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "placeholder")
    view.layer.shadowRadius = 5
    view.layer.cornerRadius = 12
    view.layer.masksToBounds = true;
    view.contentMode = .scaleAspectFill
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    configureCell()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configureCell()
  }
  
  private func configureCell() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(cardView)
    
    cardView.addSubview(bannerImage)
    
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
    ])
    
    NSLayoutConstraint.activate([
      cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      cardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      cardView.heightAnchor.constraint(equalToConstant: 100)
    ])
    
    NSLayoutConstraint.activate([
      bannerImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
      bannerImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
      bannerImage.topAnchor.constraint(equalTo: cardView.topAnchor),
      bannerImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
    ])
  }
  
  func configureData(item: CashEntity) {
    if let url = URL(string: item.bannerURL) {
      bannerImage.load(url: url)
    }
  }
}
