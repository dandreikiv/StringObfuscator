//
//  StringObfuscator.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class StringObfuscator {
	
	private let algorithm: ObfuscationAlgorithm
	
	init(algorithm: ObfuscationAlgorithm) {
		self.algorithm = algorithm
	}
	
	func obfuscate(source: String) -> String? {
		return algorithm.obfuscate(source:source);
	}
	
	func unObfuscate(string: String) -> String? {
		return algorithm.unObfuscate(source:string)
	}
}
