//
//  PaybackRepositoryImpl.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation
struct PaybackRepositoryImpl: PaybackRepository{
  
  var dataSource: PaybackDataSource
  func transactions() async throws -> [TransactionListItem] {
    let transactionItems = try await dataSource.transactions()
    return transactionItems;
  }
  
  func transactionsHttp() async throws -> TransactionHistory {
    let transactionItems = try await dataSource.transactionsHttp()
    return transactionItems;
  }
  
}
