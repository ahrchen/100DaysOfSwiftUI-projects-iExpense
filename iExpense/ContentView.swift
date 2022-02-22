//
//  ContentView.swift
//  iExpense
//
//  Created by Raymond Chen on 2/20/22.
//

import SwiftUI


struct ListView: View {
    var expenseItem: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expenseItem.name)
                    .font(.headline)
                Text(expenseItem.type)
            }
            
            Spacer()
            Text(expenseItem.amount, format: Expenses.currencyCode)
        }
        .foregroundColor(getExpenseItemColor(amount: expenseItem.amount))
    }
    
    func getExpenseItemColor(amount: Double) -> Color {
        if amount > 100.0 {
            return .red
        } else if amount > 10.0 {
            return .orange
        } else {
            return .green
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
        
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Expenses.expenseType, id: \.self) { type in
                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == type {
                                ListView(expenseItem: item)
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header : {
                        Text("Personal Expenses")
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
