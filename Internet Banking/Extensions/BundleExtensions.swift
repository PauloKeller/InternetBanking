//
//  BundleExtensions.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation

extension Bundle {
  func readAndCreateMock(fileName: String, ofType: String) -> Data? {
    guard let path = self.path(forResource: fileName, ofType: ofType) else {
      return nil
    }
    
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
      return nil
    }
    
    return data
  }
}
