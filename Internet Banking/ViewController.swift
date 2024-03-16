//
//  ViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com") else {
      return
    }
    
    let provider = ProductsProvider(baseURL: url)
//    provider.fetchProducts()
  }


}

