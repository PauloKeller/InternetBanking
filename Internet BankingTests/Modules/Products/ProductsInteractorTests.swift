//
//  ProductsInteractorTests.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

import XCTest
import Network
@testable import Internet_Banking

final class ProductsInteractorTests: XCTestCase {
  var sut: ProductsInteractor!
  var mockDelegate: MockProductsInteractorDelegate!
  var mockProvider: ProductsProviderMock!
  var mockMonitor: NetworkMonitorAdapterMock!
  
  override func setUp() {
    super.setUp()
    
    mockDelegate = MockProductsInteractorDelegate()
    mockProvider = ProductsProviderMock()
    mockMonitor = NetworkMonitorAdapterMock()
    
    sut = ProductsInteractor(provider: mockProvider, monitor: mockMonitor)
    sut.delegate = mockDelegate
  }
  
  override func tearDown() {
    super.tearDown()
    
    sut = nil
    mockDelegate = nil
    mockProvider = nil
    mockMonitor = nil
  }
  
  func testFetchProductsSuccess() {
    sut.fetchProducts()
    
    XCTAssertTrue(mockDelegate.isSuccessFetchProductsCalled)
  }
  
  func testFetchProductsFailed() {
    mockProvider.shouldReturnSusscess = false
    
    sut.fetchProducts()
    
    XCTAssertTrue(mockDelegate.isFailureFetchProductsCalled)
  }
  
  func testNoInternetConnection() {
    mockMonitor.hasInternetConnection = false
    
    sut.fetchProducts()
    
    XCTAssertTrue(mockDelegate.isNoInternetConnectionCalled)
  }
}
