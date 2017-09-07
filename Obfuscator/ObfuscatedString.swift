//
//  ObfuscatedString.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class ObfuscatedString {
	
	private var obfuscatedString: String = ""
	private let obfuscator: StringObfuscator
	
	init(algorithm: ObfuscationAlgorithm) {
		self.obfuscator = StringObfuscator(algorithm: algorithm)
	}
	
	func setString(string: String) throws {
		obfuscatedString = try self.obfuscator.obfuscate(source: string)
	}
	
	func originalString() throws -> String {
		return try self.obfuscator.unObfuscate(source: obfuscatedString)
	}
	
	func obfusated() -> String {
		return obfuscatedString
	}
}
