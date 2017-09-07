//
//  XORObfuscator.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class XORObfuscator: Obfuscator {
	
	func obfuscate(source: String) -> String? {
		return transform(source)
	}
	
	func unObfuscate(source: String) -> String? {
		return transform(source)
	}
	
	private func transform(_ source: String) -> String? {
		let data = source.data(using: .utf8)
		let key = data?.count ?? 128
		let original = [UInt8](data!)
		var modified = [UInt8](repeating: 0, count: original.count)
		
		var index = 0
		for code in original {
			modified[index] = (code ^ UInt8(key))
			index = index + 1
		}
		
		let newData = Data(modified)
		let obfuscatedString = String(data: newData, encoding: .utf8)
		
		return obfuscatedString
	}
}
