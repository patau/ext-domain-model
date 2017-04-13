//
//  DomainModeling2Tests.swift
//  SimpleDomainModel
//
//  Created by Patricia Au on 4/13/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import XCTest
import SimpleDomainModel

class DomainModeling2Tests: XCTestCase {
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let fifteenEUR = Money(amount: 15, currency: "EUR")
    let fifteenCAN = Money(amount: 15, currency: "CAN")
    
    //Test Money desc
    func testMoneyDesc() {
        XCTAssert(tenUSD.description == "USD10")
        XCTAssert(twelveUSD.description == "USD12")
        XCTAssert(fiveGBP.description == "GBP5")
        XCTAssert(fifteenEUR.description == "EUR15")
        XCTAssert(fifteenCAN.description == "CAN15")
    }
    
    //Test Money desc when converting
    func testConvertMoneyDesc() {
        let USDtoGBP = tenUSD.convert("GBP")
        print("USDtoGBP: \(USDtoGBP)")
        XCTAssert(USDtoGBP.description == "GBP5")
        
        let CANtoUSD = fifteenCAN.convert("USD")
        XCTAssert(CANtoUSD.description == "USD12")
    }
    
    //Tests double extension
    //Tests add protocol with same currency types
    func testProtocolAddUSDtoUSD() {
        let tenUSD = 10.0.USD
        XCTAssert(tenUSD.amount == 10 && tenUSD.currency == "USD")
        let twentyUSD = 20.0.USD
        XCTAssert(twentyUSD.amount == 20 && twentyUSD.currency == "USD")
        
        let resultUSD = tenUSD.add(twentyUSD) // --> 30
        XCTAssert(resultUSD.amount == 30 && resultUSD.currency == "USD")
    }
    
    //Tests double extension
    //Tests add protocol with different currency types
    func testProtocolAddUSDtoGBP() {
        let tenUSD = 10.0.USD
        XCTAssert(tenUSD.amount == 10 && tenUSD.currency == "USD")
        let twentyGBP = 20.0.GBP
        XCTAssert(twentyGBP.amount == 20 && twentyGBP.currency == "GBP")
        
        let result = tenUSD.add(twentyGBP) // --> 25GBP
        XCTAssert(result.amount == 25 && result.currency == "GBP")
    }
    
    //Tests double extension
    //Tests subtract protocol with same currency types
    func testProtocolSubtractCANfromCAN() {
        let tenCAN = 10.0.CAN
        XCTAssert(tenCAN.amount == 10 && tenCAN.currency == "CAN")
        let twentyCAN = 20.0.CAN
        XCTAssert(twentyCAN.amount == 20 && twentyCAN.currency == "CAN")
        
        let result = tenCAN.subtract(twentyCAN) // --> 10CAN
        print("Result: \(result)")
        XCTAssert(result.amount == 10)
        XCTAssert(result.currency == "CAN")
    }
    
    //Tests double extension
    //Tests subtract protocol with different currency types
    func testProtocolSubtractUSDfromGBP() {
        let tenUSD = 10.0.USD
        XCTAssert(tenUSD.amount == 10 && tenUSD.currency == "USD")
        let twentyGBP = 20.0.GBP
        XCTAssert(twentyGBP.amount == 20 && twentyGBP.currency == "GBP")
        
        let result = tenUSD.subtract(twentyGBP) // --> 30USD
        print("Result: \(result)")
        XCTAssert(result.amount == 30)
        XCTAssert(result.currency == "USD")
    }
    
    //Tests double extension
    //Tests subtract protocol with different currency types
    func testProtocolSubtractCANfromUSD() {
        let fourUSD = 4.0.USD
        XCTAssert(fourUSD.amount == 4 && fourUSD.currency == "USD")
        //20CAN -> 16USD
        let twentyCAN = 20.0.CAN
        XCTAssert(twentyCAN.amount == 20 && twentyCAN.currency == "CAN")
        
        let result = fourUSD.subtract(twentyCAN) //(16USD) - 4USD = 12USD
        print("Result: \(result)")
        XCTAssert(result.amount == 12)
        XCTAssert(result.currency == "USD")
    }


}
