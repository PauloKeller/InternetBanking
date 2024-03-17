//
//  ProductsPresenter.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

protocol ProductsPresenterDelegate: AnyObject {
  func loadProducts()
}

protocol ProductsPresenterProtocol {
  func viewDidLoad()
  var responseData: ProductsResponseEntity? { get }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

class ProductsPresenter {
  let interactor: ProductsInteractorProtocol
  weak var delegate: ProductsPresenterDelegate?
  private(set) var responseData: ProductsResponseEntity?
  let homeSections: [HomeSection] = [.spotlight, .cash, .product]
  
  init(interactor: ProductsInteractorProtocol) {
    self.interactor = interactor
  }
}

extension ProductsPresenter: ProductsPresenterProtocol {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch homeSections[indexPath.row] {
    case .spotlight, .product:
      return 200
    case .cash:
      return 180
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return homeSections.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch homeSections[indexPath.row] {
    case .spotlight:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TopBannerTableViewCell.identifier) as? TopBannerTableViewCell else {
        return UITableViewCell()
      }
      
      if let items = responseData?.spotlight {
        cell.configureData(items: items)
      }
    
      return cell
    case .cash:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterBannerTableViewCell.identifier) as? CenterBannerTableViewCell else {
        return UITableViewCell()
      }
      
      if let item = responseData?.cash {
        cell.configureData(item: item)
      }
      
      return cell
    case .product:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier) as? ProductsTableViewCell else {
        return UITableViewCell()
      }
      
      if let items = responseData?.products {
        cell.configureData(items: items)
      }
      
      return cell
    }
  }
  
  func viewDidLoad() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.interactor.fetchProducts()
    }
  }
}

extension ProductsPresenter: ProductsInteractorDelegate {
  func successFetchProducts(data: ProductsResponseEntity) {
    responseData = data
    delegate?.loadProducts()
  }
  
  func failureFetchProducts() {
    // TODO: Need to implement
    print("failed to fetch data")
  }
  
  func noInternetConnection() {
    // TODO: Need to implement
    print("no internet")
  }
}
