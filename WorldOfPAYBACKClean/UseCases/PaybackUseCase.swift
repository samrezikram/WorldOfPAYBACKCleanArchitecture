//
//  PaybackUseCase.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation
enum UseCaseError: Error{
    case networkError, decodingError
}

protocol GetPaybackTransaction {
    func execute() async -> Result<[TransactionListItem], UseCaseError>
}

struct GetPaybackUseCase: GetPaybackTransaction{
    var repo: PaybackRepository
    
    func execute() async -> Result<[TransactionListItem], UseCaseError>{
        do{
            let transactionItems = try await repo.transactions()
            return .success(transactionItems)
        }catch(let error){
            switch(error){
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
