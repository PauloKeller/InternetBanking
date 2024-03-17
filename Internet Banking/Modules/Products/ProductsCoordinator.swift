//
//  ProductsCoordinator.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit
import Network

class ProductsCoordinator: CoordinatorProtocol {
  private var viewController: ProductsViewController
  var childCoordinators = [CoordinatorProtocol]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.viewController = ProductsViewController()
    
    let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com")!
    let nwPathMonitor = NWPathMonitor()
    let monitor = NetworkMonitorAdapter(monitor: nwPathMonitor)
    let provider = ProductsProvider(baseURL: url)
    let interactor = ProductsInteractor(provider: provider, monitor: monitor)
    let presenter = ProductsPresenter(interactor: interactor, coordinator: self)
    presenter.delegate = viewController
    interactor.delegate = presenter
    self.viewController.presenter = presenter
  }
  
  func start() {
    navigationController.pushViewController(viewController, animated: false)
  }
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    navigationController.present(alert, animated: true, completion: nil)
  }
}
