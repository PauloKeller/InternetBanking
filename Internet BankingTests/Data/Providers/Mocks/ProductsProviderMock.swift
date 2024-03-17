//
//  ProductsProviderMock.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

@testable import Internet_Banking

class ProductsProviderMock: ProductsProviderProtocol {
  var shouldReturnSusscess = true
  
  func fetchProducts(successCallback: @escaping (ProductsResponseEntity) -> Void, failureCallback: @escaping (ProductsErrors) -> Void) {
    if (shouldReturnSusscess) {
      let cashMock = CashEntity(title: "Mock title", bannerURL: "mock banner", description: "mock description")
      
      successCallback(ProductsResponseEntity(spotlight: [], products: [], cash: cashMock))
    } else {
      failureCallback(ProductsErrors.failedToParseProducts)
    }
  }
}
