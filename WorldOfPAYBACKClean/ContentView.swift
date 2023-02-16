//
//  ContentView.swift
//  WorldOfPAYBACKClean
//
//  Created by Samrez Ikram on 13/02/2023.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
      TransactionsView(viewModel: TrsansactionsViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
