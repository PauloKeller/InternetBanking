//
//  NetworkMonitorAdapter.swift
//  Internet BankingTests
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation
import Network

protocol NetworkMonitorAdapterProtocol {
  var status: NWPath.Status { get }
}

class NetworkMonitorAdapter: NetworkMonitorAdapterProtocol {
  let monitor: NWPathMonitor
  
  init(monitor: NWPathMonitor) {
    self.monitor = monitor
  }
  
  var status: NWPath.Status {
    return monitor.currentPath.status
  }
}
