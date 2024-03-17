//
//  ProductsViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductsViewController: UIViewController {
  let productsData = ["1", "2", "3"]
  
  let header: ProductsHeader = {
    let header = ProductsHeader(frame: .zero)
    header.titleLabel.text = "Olá, Maria"
    header.translatesAutoresizingMaskIntoConstraints = false
    return header
  }()
  
  let tableView: UITableView = {
    let view = UITableView()
    view.register(TopBannerTableViewCell.self, forCellReuseIdentifier: TopBannerTableViewCell.identifier)
    view.register(CenterBannerTableViewCell.self, forCellReuseIdentifier: CenterBannerTableViewCell.identifier)
    view.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.identifier)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private func viewConfiguration() {
    view.backgroundColor = .white
    
    tableView.separatorStyle = .none
    tableView.dataSource = self
    tableView.delegate = self
    tableView.estimatedRowHeight = 150
    
    self.view.addSubview(header)
    self.view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      header.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      header.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
      header.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      tableView.topAnchor.constraint(equalTo: header.safeAreaLayoutGuide.bottomAnchor, constant: 10),
      tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
    ])
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewConfiguration()
  }
}

extension ProductsViewController: UITableViewDelegate {
  
}

extension ProductsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productsData.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch productsData[indexPath.row] {
    case "1":
      return 200
    case "2":
      return 180
    case "3":
      return 200
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch productsData[indexPath.row] {
    case "1":
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TopBannerTableViewCell.identifier) as? TopBannerTableViewCell else {
        return UITableViewCell()
      }
      
      return cell
    case "2":
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterBannerTableViewCell.identifier) as? CenterBannerTableViewCell else {
        return UITableViewCell()
      }
      
      cell.configureData(item: CashEntity(title: "mock title", bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png", description: "mock desc"))
      
      return cell
    case "3":
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier) as? ProductsTableViewCell else {
        return UITableViewCell()
      }
      
      return cell
    default:
      return UITableViewCell()
    }
  }
}

