//
//  CoordinatorProtocol.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
