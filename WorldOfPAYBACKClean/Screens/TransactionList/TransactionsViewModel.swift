//
//  PaybackViewModel.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation
import SwiftUI

@MainActor
class TrsansactionsViewModel: ObservableObject {
  
  var getPaybackUseCase = GetPaybackUseCase(repo: PaybackRepositoryImpl(dataSource: PaybackServiceImpl()))
  @Published var transactionItems: [TransactionListItem] = []
  @Published var filteredTransactionItems: [TransactionListItem] = []

  @Published var errorMessage = ""
  @Published var hasError = false
  @Published var categories: [TransactionType] = []
  
  func getTransactions() async {
    errorMessage = ""
    let result = await getPaybackUseCase.execute()
    switch result {
    case .success(let transactionItems):
      self.transactionItems = transactionItems
      self.filteredTransactionItems = transactionItems
      self.categories = Array(Set(transactionItems.map { $0.category }).map({ category in
        TransactionType(category: category)
      }))
      

    case .failure(let error):
      self.transactionItems = []
      errorMessage = error.localizedDescription
      hasError = true
    }
  }
  
  func filterTransactions(by: Int) {
    
  }
}
