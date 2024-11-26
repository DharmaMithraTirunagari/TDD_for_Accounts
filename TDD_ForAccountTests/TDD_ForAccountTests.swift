//
//  TDD_ForAccountTests.swift
//  TDD_ForAccountTests
//
//  Created by Srikanth Kyatham on 11/26/24.
//

import XCTest
@testable import TDD_ForAccount


final class TDD_ForAccountTests: XCTestCase {
    
    var account: Account!
    var capturedMessage : String?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        account = Account(initialBalance: 0.0)
        account.fatalErrorHandler = { message in
            self.capturedMessage = message
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        account = nil
        capturedMessage = nil
    }
    

        // MARK: - Test Cases

    func testInitialBalance() {
            XCTAssertEqual(account.getBalance(), 0.0)
        }
        
        func testDepositValidAmount() {
            account.deposit(amount: 10.0)
            XCTAssertEqual(account.getBalance(), 10.0, "Deposit should increase the balance by 10.0")
        }
        
        func testWithdrawVallidAmount() {
            account.deposit(amount: 10.0)
            account.withdraw(amount: 5.0)
            XCTAssertEqual(account.getBalance(), 5.0, "Withdraw should decrease the balance by 5.0")
        }
        func testInvalidDepositAmount() {
            account.deposit(amount: -100)
            XCTAssertEqual(capturedMessage, "Deposit amount must be positive")
        }
        func testWithdrawMoreThanBalance() {
        account.deposit(amount: 10.0)
        account.withdraw(amount: 20.0)
        XCTAssertEqual(capturedMessage, "Insufficient funds")
    }
    func testInvalidWithdrawAmount() {
        account.deposit(amount: 10.0)
        account.withdraw(amount: -20.0)
        XCTAssertEqual(capturedMessage, "Withdrawal amount must be positive")
    }

}
