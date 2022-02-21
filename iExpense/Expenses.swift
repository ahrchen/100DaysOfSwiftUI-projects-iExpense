//
//  Expenses.swift
//  iExpense
//
//  Created by Raymond Chen on 2/21/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
