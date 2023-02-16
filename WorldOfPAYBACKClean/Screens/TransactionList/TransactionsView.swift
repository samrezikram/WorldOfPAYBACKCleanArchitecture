//
//  TransactionsView.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 14/02/2023.
//

import Foundation
import SwiftUI

struct TransactionsView: View {
  @StateObject var viewModel = TrsansactionsViewModel()
  
  @State var showSheet = false
  @State var selectedCategories = []
  var body: some View {
    TransactionsList()
  }
  
#if DEBUG
  struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
      TransactionsView()
    }
  }
#endif
  
  fileprivate func TransactionsList() -> some View {
    NavigationStack {
      ZStack(alignment: Alignment(horizontal: .center, vertical: VerticalAlignment.bottom), content: {
        List(viewModel.filteredTransactionItems) { transaction in
          NavigationLink(
            destination: TransactionDetailView(viewModel: TransactionDetailViewModel(transactionDetailItem: transaction)),
            label: {
              TransactionViewCell(transaction)
                .padding()
                .listRowSeparator(.visible, edges: .all)
            }
          )
        }.task {
          await viewModel.getTransactions()
        }.navigationTitle("Transaction List")
          .alert("Error", isPresented: $viewModel.hasError) {
          } message: {
            Text(viewModel.errorMessage)
          }
        BottomSheetView(isOpen: $showSheet, maxHeight: 90 * CGFloat(self.viewModel.categories.count)) {
          BottomSheet(viewModel: viewModel, categories: self.viewModel.categories)
        }.ignoresSafeArea(.all, edges: .bottom)
      })
    }
    
  }
  
  fileprivate func TransactionViewCell(_ transaction: TransactionListItem) -> some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading) {
        HStack {
          Text(transaction.bankingDate).bold().font(.system(size: 16))
        }
        Spacer()
        HStack(alignment: .lastTextBaseline) {
          Text(transaction.partnerDisplayName).bold().font(.system(size: 11))
          Spacer()
          HStack(spacing: 2) {
            Text(String(transaction.amount)).font(.system(size: 11, weight: .bold, design: .monospaced))
            Text(transaction.currency).font(.system(size: 9, weight: .bold, design: .monospaced))
          }
        }
        VStack(alignment: .center) {
          HStack {
            Text(transaction.transactionDescription).font(.system(size: 11)).frame(alignment: .leading)
            Text(String(transaction.category)).font(.system(size: 9, weight: .bold, design: .monospaced))
          }.foregroundColor(.gray)
        }
      }
    }
  }
    
  struct BottomSheet: View {
    var viewModel: TrsansactionsViewModel
    let categories: [TransactionType]
    
    var body: some View {
      HStack {
        Text("Filter by Category ")
      }
      VStack(spacing: 0) {
        List {
          ForEach(categories) { category in
            CategoryViewCell(category: category).gesture(TapGesture()
              .onEnded({ _ in
                let selectedCategorizedTransactionItems = viewModel.transactionItems.filter { item in
                  item.category == category.category
                }
                viewModel.filteredTransactionItems = selectedCategorizedTransactionItems
              }))
          }.listRowSeparator(.visible, edges: .all)
            
        }.listStyle(PlainListStyle())
      }


    }
  }
  
  struct CategoryViewCell: View {
    let category: TransactionType
    var body: some View {
      HStack {
        fillWidth
        Text(String(category.category)).bold().font(.system(size: 16)).frame(maxWidth: .infinity).border(Color.clear)
      }

    }
    
    private var fillWidth: some View {
      VStack {
        Spacer()
      }
    }
  }
    
  struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView{
        TransactionsView()
      }.navigationViewStyle(StackNavigationViewStyle())
    }
  }
    

}
