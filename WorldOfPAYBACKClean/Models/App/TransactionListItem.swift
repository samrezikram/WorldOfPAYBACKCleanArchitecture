//
//  TransactionListItem.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation
struct TransactionListItem: Identifiable, Hashable {
  let id: String
  let bankingDate: String
  let partnerDisplayName: String
  let transactionDescription: String
  let amount: Int
  let currency: String
  let category: Int

  init(transactionItem: TransactionHistoryItem) {
    id = transactionItem.alias.reference + transactionItem.transactionDetail.bookingDate + UUID().uuidString
    bankingDate = transactionItem.transactionDetail.bookingDate.formatISODate()
    partnerDisplayName = transactionItem.partnerDisplayName
    transactionDescription = transactionItem.transactionDetail.description ?? ""
    amount = transactionItem.transactionDetail.value.amount
    currency = transactionItem.transactionDetail.value.currency
    category = transactionItem.category
  }

  static func == (lhs: TransactionListItem, rhs: TransactionListItem) -> Bool {
    return lhs.id == rhs.id &&
    lhs.bankingDate == rhs.bankingDate &&
    lhs.partnerDisplayName == rhs.partnerDisplayName &&
    lhs.transactionDescription == rhs.transactionDescription &&
    lhs.amount == rhs.amount &&
    lhs.currency == rhs.currency &&
    lhs.category == rhs.category
  }
}
