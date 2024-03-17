//
//  TopBannerTableViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {
  static let identifier = "TopBannerTableViewCell"
  var spotlightItems: [SpotlightItemEntity] = [SpotlightItemEntity(name: "Mock test", bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png", description: "Mock desc")]
  
  let collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 170)
    let view = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
    view.register(SpotlightItemCollectionViewCell.self, forCellWithReuseIdentifier: SpotlightItemCollectionViewCell.indentifier)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.cyan
    view.isPagingEnabled = true
    return view
  }()
  
  func configureData(spotligthItem: [SpotlightItemEntity]) {
    self.spotlightItems = spotligthItem
    
    collectionView.reloadData()
  }
  
  private func configureCell() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    contentView.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
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
}

extension TopBannerTableViewCell: UICollectionViewDelegate {
  
}

extension TopBannerTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return spotlightItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightItemCollectionViewCell.indentifier, for: indexPath) as? SpotlightItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    cell.configureData(spotlightItem: spotlightItems[indexPath.row])
    cell.backgroundColor = UIColor.green
    return cell
  }
}
