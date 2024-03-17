//
//  ProductsResponseEntity.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation

struct ProductsResponseEntity: Decodable {
  var spotlight: [SpotlightItemEntity]
  var products: [ProductItemEntity]
  var cash: CashEntity
}
