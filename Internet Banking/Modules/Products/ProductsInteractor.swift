//
//  ProductsInteractor.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation
import Network

protocol ProductsInteractorDelegate: AnyObject {
  func successFetchProducts(data: ProductsResponseEntity)
  func failureFetchProducts()
  func noInternetConnection()
}

protocol ProductsInteractorProtocol {
  func fetchProducts()
}

class ProductsInteractor: ProductsInteractorProtocol {
  let provider: ProductsProviderProtocol
  let monitor: NetworkMonitorAdapterProtocol
  weak var delegate: ProductsInteractorDelegate?
  
  init(provider: ProductsProviderProtocol, monitor: NetworkMonitorAdapterProtocol) {
    self.provider = provider
    self.monitor = monitor
  }
  
  func fetchProducts() {
    if monitor.status == .satisfied {
      self.provider.fetchProducts(successCallback: { data in
        self.delegate?.successFetchProducts(data: data)
      }, failureCallback: { error in
        self.delegate?.failureFetchProducts()
      })
    } else {
      self.delegate?.noInternetConnection()
    }
  }
}
