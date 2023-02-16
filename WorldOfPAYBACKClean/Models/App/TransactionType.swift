//
//  TransactionType.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 15/02/2023.
//

import Foundation
struct TransactionType: Identifiable, Codable {
  var id: String
  var category: Int
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(id)
  }
  
  init(category: Int) {
    self.id = UUID().uuidString
    self.category = category
  }
}
