//
//  ObfuscatorTests.swift
//  ObfuscatorTests
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import XCTest
@testable import Obfuscator

class ObfuscatorTests: XCTestCase {
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testXORObfuscator() {
		let source = "NL88INGB0123456789"
		let obfuscator = StringObfuscator(algorithm: XORObfuscator())
		
		testGiven(string: source, convertedBy: obfuscator)
    }
	
	func testCahrObfuscator() {
		let source = "NL88INGB0123456789"
		let obfuscator = StringObfuscator(algorithm: CharObfuscator())
		
		testGiven(string: source, convertedBy: obfuscator)
	}
	
	func testGiven(string: String, convertedBy obfuscator: StringObfuscator) {
		do {
			let obfuscatedSource = try obfuscator.obfuscate(source: string)
			let unobfuscatedString = try obfuscator.unObfuscate(source: obfuscatedSource)
			XCTAssertEqual(string, unobfuscatedString)
		} catch ObfuscationError.DataConvertionError {
			print("Coudn't convert data into string")
		} catch ObfuscationError.StringConvertionError {
			print("Coudn't get data from string")
		} catch {
			print("Unexpected exception happend.")
		}
	}
}
