//
//  ObfuscatorTests.swift
//  ObfuscatorTests
//
//  Created by dmytro.andreikiv@philips.com on 06/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import XCTest

class ObfuscatorTests: XCTestCase {
	
	let source = "NL88INGB0123456789"
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testXORObfuscator() {
		
		let obfuscator = StringObfuscator(algorithm: XORObfuscator())
		
		testGiven(string: source, convertedBy: obfuscator)
    }
	
	func testCahrObfuscator() {
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
	
	func testObfuscatedStringReturnsOriginalValue() {
		let obfuscatedString = ObfuscatedString(algorithm: CharObfuscator())
		do {
			try obfuscatedString.setString(string: source)
			let originalString = try obfuscatedString.originalString()
			XCTAssertEqual(originalString,  source)
		}  catch {
			print("Unexpected exception happend.")
		}
	}
	
	func testObfuscatedStringNotEqualToOriginal() {
		let obfuscatedString = ObfuscatedString(algorithm: CharObfuscator())
		do {
			try obfuscatedString.setString(string: source)
			let obfuscated = obfuscatedString.obfusated()
			XCTAssertNotEqual(obfuscated, source)
		}  catch {
			print("Unexpected exception happend.")
		}
	}
}
