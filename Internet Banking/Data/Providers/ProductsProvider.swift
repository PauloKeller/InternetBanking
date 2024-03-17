//
//  ProductsProvider.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation

enum ProductsErrors: Error {
  case failedToParseProducts
  case failedToFetch
}

enum ProductsEndPoints: String {
  case products
}

protocol ProductsProviderProtocol {
  func fetchProducts(successCallback: @escaping (ProductsResponseEntity) -> Void, failureCallback: @escaping (ProductsErrors) -> Void)
}

class ProductsProvider: URLSessionClient, ProductsProviderProtocol {
  func fetchProducts(successCallback: @escaping (ProductsResponseEntity) -> Void, failureCallback: @escaping (ProductsErrors) -> Void) {
    let sessionRequest = URLSessionRequestParameters(path: "/sandbox/products", method: .get)
    
    request(parameters: sessionRequest) { (result) in
      switch result {
      case .success(let response):
        do {
          let response = try response.decode(to: ProductsResponseEntity.self)
          successCallback(response.body)
        } catch {
          failureCallback(ProductsErrors.failedToParseProducts)
        }
      case .failure(_):
        failureCallback(ProductsErrors.failedToFetch)
      }
    }
  }
}

