//
//  ObfuscatedString.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

public class ObfuscatedString {
	
	private var obfuscatedString: String = ""
	private let obfuscator: StringObfuscator
	
	public init(algorithm: ObfuscationAlgorithm) {
		self.obfuscator = StringObfuscator(algorithm: algorithm)
	}
	
	public func setString(string: String) throws {
		obfuscatedString = try self.obfuscator.obfuscate(source: string)
	}
	
	public func originalString() throws -> String {
		return try self.obfuscator.unObfuscate(source: obfuscatedString)
	}
	
	public func obfusated() -> String {
		return obfuscatedString
	}
}
