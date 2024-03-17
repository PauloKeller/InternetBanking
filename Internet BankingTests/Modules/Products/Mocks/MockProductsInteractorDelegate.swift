//
//  MockProductsInteractorDelegate.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

@testable import Internet_Banking

class MockProductsInteractorDelegate: ProductsInteractorDelegate {
  var isSuccessFetchProductsCalled = false
  var isFailureFetchProductsCalled = false
  var isNoInternetConnectionCalled = false
  
  func successFetchProducts(data: ProductsResponseEntity) {
    isSuccessFetchProductsCalled = true
  }
  
  func failureFetchProducts() {
    isFailureFetchProductsCalled = true
  }
  
  func noInternetConnection() {
    isNoInternetConnectionCalled = true
  }
}
