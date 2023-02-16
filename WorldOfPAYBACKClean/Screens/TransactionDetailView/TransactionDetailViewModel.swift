//
//  TransactionDetailViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Samrez Ikram on 12/02/2023.
//

import Combine
import Foundation

@MainActor
class TransactionDetailViewModel: ObservableObject {
  
  @Published var transactionDetailItem: TransactionListItem
  
  @Published var errorMessage = ""
  @Published var hasError = false
  
  init(transactionDetailItem: TransactionListItem, errorMessage: String = "", hasError: Bool = false) {
    self.transactionDetailItem = transactionDetailItem
    self.errorMessage = errorMessage
    self.hasError = hasError
  }
  
}
