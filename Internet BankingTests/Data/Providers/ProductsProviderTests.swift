//
//  ProductsProviderTests.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation
import XCTest
@testable import Internet_Banking

final class ProductsProviderTests: XCTestCase {
  private var sut: ProductsProvider!
  
  override func setUp() {
    super.setUp()
    
    let session: URLSession = {
      let configuration: URLSessionConfiguration = .ephemeral
      configuration.protocolClasses = [MockURLProtocol.self]
      return URLSession(configuration: configuration)
    }()
    
    sut = ProductsProvider(baseURL: URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com")!, session: session)
  }
  
  override func tearDown() {
    super.tearDown()
    
    sut = nil
  }
  
  func testGetProducts() throws {
    if let data = Bundle(for: type(of: self)).readAndCreateMock(fileName: "GetProducts", ofType: "json") {
      MockURLProtocol.error = nil
      MockURLProtocol.requestHandler = { request in
          let response = HTTPURLResponse(url: URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")!,
                                         statusCode: 200,
                                         httpVersion: nil,
                                         headerFields: ["Content-Type": "application/json"])!
          return (response, data)
      }
    }
    
    var expected: ProductsResponseEntity?
  
    let expectation = XCTestExpectation(description: #function)
    
    sut.fetchProducts(successCallback: { data in
      expected = data
      
      expectation.fulfill()
    }, failureCallback: { error in
      XCTFail("Expected products fetch, but failed \(error).")
    })
    
    wait(for: [expectation], timeout: 3.0)
    
    XCTAssertEqual(expected?.products.count, 3)
    XCTAssertEqual(expected?.cash.title, "digio Cash")
    XCTAssertEqual(expected?.spotlight.count, 2)
  }
}
