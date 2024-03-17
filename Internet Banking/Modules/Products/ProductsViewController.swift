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
  
  private func viewConfiguration() {
    self.view.addSubview(header)
    
    NSLayoutConstraint.activate([
      header.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      header.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
      header.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .red
    
    viewConfiguration()
  }
  
}

