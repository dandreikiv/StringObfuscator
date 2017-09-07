//
//  ObfuscationAlgorithm.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

enum ObfuscationError: Error {
	case StringConvertionError
	case DataConvertionError
}

public protocol ObfuscationAlgorithm {
	// Obfuscates a source string and returns new string.
	func obfuscate(source: String) throws -> String
	
	// Unobfuscates source string and returs orginal string.
	func unObfuscate(source: String) throws -> String
}
