//
//  ViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import UIKit
import Network

class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com") else {
      return
    }
    
    let monitor = NetworkMonitorAdapter(monitor: NWPathMonitor())
    let provider = ProductsProvider(baseURL: url)
    let interactor = ProductsInteractor(provider: provider, monitor: monitor)
    
    interactor.delegate = self
    interactor.fetchProducts()
  }
}

extension ViewController: ProductsInteractorDelegate {
  func successFetchProducts(data: ProductsResponseEntity) {
    print(data.products.count)
  }
  
  func failureFetchProducts() {
    print("failed to fetch")
  }
  
  func noInternetConnection() {
    print("no internet connection")
  }
}

