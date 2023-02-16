//
//  PaybackDataSource.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation

protocol PaybackDataSource{
    func transactionsHttp() async throws -> TransactionHistory
    func transactions() async throws -> [TransactionListItem]
}
