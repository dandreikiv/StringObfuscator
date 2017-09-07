//
//  XORObfuscator.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class XORObfuscator: ObfuscationAlgorithm {
	
	func obfuscate(source: String) throws -> String {
		return try transform(source)
	}
	
	func unObfuscate(source: String) throws -> String {
		return try transform(source)
	}
	
	private func transform(_ source: String) throws -> String {
		
		guard let data = source.data(using: .utf8) else {
			throw ObfuscationError.StringConvertionError
		}
		
		let key = data.count
		let original = [UInt8](data)
		var modified = [UInt8](repeating: 0, count: original.count)
		
		var index = 0
		for code in original {
			modified[index] = (code ^ UInt8(key))
			index = index + 1
		}
		
		let newData = Data(modified)
		guard let obfuscatedString = String(data: newData, encoding: .utf8) else {
			throw ObfuscationError.DataConvertionError
		}
		
		return obfuscatedString
	}
}
