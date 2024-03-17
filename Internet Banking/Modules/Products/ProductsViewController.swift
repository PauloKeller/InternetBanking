//
//  ProductsViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductsViewController: UIViewController {
  
  let header: ProductsHeader = {
    let header = ProductsHeader(frame: .zero)
    header.translatesAutoresizingMaskIntoConstraints = false
    return header
  }()
  
  let tableView: UITableView = {
    let view = UITableView()
    view.register(TopBannerTableViewCell.self, forCellReuseIdentifier: TopBannerTableViewCell.identifier)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private func viewConfiguration() {
    tableView.dataSource = self
    tableView.delegate = self
    
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
    
    self.view.backgroundColor = .red
    
    viewConfiguration()
  }
}

extension ProductsViewController: UITableViewDelegate {
  
}

extension ProductsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TopBannerTableViewCell.identifier) as? TopBannerTableViewCell else {
      return UITableViewCell()
    }
    
    return cell
  }
}

