//
//  ProductsTableViewCell.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

protocol ProductsTableViewCellDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class ProductsTableViewCell: UITableViewCell {
  static let identifier = "ProductsTableViewCell"
  var items = [ProductItemEntity]()
  weak var delegate: ProductsTableViewCellDelegate?
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Produtos"
    label.font = .boldSystemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 150, height: 150)
    let view = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
    view.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isPagingEnabled = true
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
    collectionView.delegate = self
    collectionView.dataSource = self
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
    ])
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configureData(items: [ProductItemEntity]) {
    self.items = items
    
    collectionView.reloadData()
  }
}

extension ProductsTableViewCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
  }
}

extension ProductsTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    cell.configureData(item: items[indexPath.row])
    return cell
  }
}
