//
//  TransactionDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Samrez Ikram on 12/02/2023.
//

import Combine
import SwiftUI

struct TransactionDetailView: View {
  @ObservedObject var viewModel: TransactionDetailViewModel
  
  var body: some View {
    transaction(viewModel.transactionDetailItem)
  }
  private func transaction(_ transactionItem: TransactionListItem) -> some View {
    VStack {
      fillWidth
      
      Text(transactionItem.partnerDisplayName)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Divider()
      
      HStack {
        Text(transactionItem.transactionDescription)
      }
      .font(.subheadline)
    }
  }

  private var fillWidth: some View {
    HStack {
      Spacer()
    }
  }
}
