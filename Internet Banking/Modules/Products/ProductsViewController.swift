//
//  ProductsViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductsViewController: UIViewController {
  var presenter: ProductsPresenterProtocol!
  
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
    
    view.addSubview(header)
    view.addSubview(tableView)
    
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
    presenter.viewDidLoad()
  }
}

extension ProductsViewController: UITableViewDelegate {
  
}

extension ProductsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.tableView(tableView, numberOfRowsInSection: section)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return presenter.tableView(tableView, heightForRowAt: indexPath)
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.tableView(tableView, cellForRowAt: indexPath)
  }
}

extension ProductsViewController: ProductsPresenterDelegate {
  func loadProducts() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

