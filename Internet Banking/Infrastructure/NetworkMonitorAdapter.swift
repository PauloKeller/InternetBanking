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
  
  func pathUpdatehandler(completion: @escaping (NWPath) -> Void)
}

class NetworkMonitorAdapter: NetworkMonitorAdapterProtocol {
  let monitor: NWPathMonitor
  
  init(monitor: NWPathMonitor) {
    self.monitor = monitor
    
    let queue = DispatchQueue(label: "Monitor")
    monitor.start(queue: queue)
  }
  
  func pathUpdatehandler(completion: @escaping (NWPath) -> Void) {
    monitor.pathUpdateHandler = { path in
      completion(path)
    }
  }

  var status: NWPath.Status {
    return monitor.currentPath.status
  }
}
