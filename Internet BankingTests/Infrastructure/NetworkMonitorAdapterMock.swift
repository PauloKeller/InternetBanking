//
//  NetworkMonitorAdapterMock.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

import Network
@testable import Internet_Banking

class NetworkMonitorAdapterMock: NetworkMonitorAdapterProtocol {
  var hasInternetConnection = true
  
  var status: NWPath.Status {
    if hasInternetConnection {
      return .satisfied
    }
    
    return .requiresConnection
  }
}
