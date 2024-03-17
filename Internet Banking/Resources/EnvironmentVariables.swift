//
//  EnvironmentVariables.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import Foundation

struct EnvironmentVariables {
  static var apiBaseURL: String {
    guard let value = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
      print("No value found for API_BASE_URL in evironment variables")
      return ""
    }
    
    return value
  }
}
