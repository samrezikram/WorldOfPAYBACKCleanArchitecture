//
//  PaybackService.swift
//  WorldOfPAYBACK
//
//  Created by Samrez Ikram on 09/02/2023.
//

import Combine
import Foundation

enum APIServiceError: Error{
    case badUrl, fileNotFound, requestError, decodingError, statusNotOK
}

struct PaybackServiceImpl: PaybackDataSource {

  func transactionsHttp() async throws -> TransactionHistory {
    guard let url = URL(string:  "\(Constants.Network.API.BASE_URL)/transaction") else{
      throw APIServiceError.badUrl
    }
            
    guard let (data, response) = try? await URLSession.shared.data(from: url) else{
        throw APIServiceError.requestError
    }
            
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw APIServiceError.statusNotOK
    }
            
    guard let result = try? JSONDecoder().decode(TransactionHistory.self, from: data) else {
        throw APIServiceError.decodingError
    }
    return result
  }
  
  func transactions() async throws -> [TransactionListItem] {
    guard let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") else {
      throw APIServiceError.fileNotFound
    }
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
      throw APIServiceError.badUrl
    }
    let decoder = JSONDecoder()
    guard let transactionHistory = try? decoder.decode(TransactionHistory.self, from: data) else {
      throw APIServiceError.decodingError
    }
    return transactionHistory.items.sorted(by: {
      $0.transactionDetail.bookingDate.getISODate().compare($1.transactionDetail.bookingDate.getISODate()) == .orderedDescending
    }).map { item in
      TransactionListItem(transactionItem: item)
    }
  }
}


