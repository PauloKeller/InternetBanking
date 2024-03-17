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
    label.font = .systemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let bannerImage: BannerImage = {
    let banner = BannerImage(frame: .zero)
    banner.translatesAutoresizingMaskIntoConstraints = false
    return banner
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
    contentView.addSubview(bannerImage)
    
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
    ])
    
    NSLayoutConstraint.activate([
      bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
      bannerImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      bannerImage.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  func configureData(cash: CashEntity) {
    if let url = URL(string: cash.bannerURL) {
      bannerImage.load(url: url)
    }
  }
}
