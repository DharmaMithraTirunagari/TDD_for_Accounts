//
//  Account.swift
//  TDD_ForAccount
//
//  Created by Srikanth Kyatham on 11/26/24.
//


class Account {
    private var balance: Double
    
    var fatalErrorHandler: ((String) -> Void) = { message in
            fatalError(message)
        }
    
    init(initialBalance: Double) {
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        guard amount > 0 else {
            fatalErrorHandler("Deposit amount must be positive")
            return
        }
        balance += amount
    }
    
    func withdraw(amount: Double) {
        guard amount > 0 else {
            fatalErrorHandler("Withdrawal amount must be positive")
            return
        }
        guard balance >= amount else {
            fatalErrorHandler("Insufficient funds")
            return
        }
        balance -= amount
    }
    
    func getBalance() -> Double {
        return balance
    }
    
}
