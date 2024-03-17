//
//  ProductsTableViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
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
    
  }
  
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
}
