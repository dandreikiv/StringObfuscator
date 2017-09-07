//
//  StringObfuscator.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

public class StringObfuscator {
	
	private let algorithm: ObfuscationAlgorithm
	
	public init(algorithm: ObfuscationAlgorithm) {
		self.algorithm = algorithm
	}
	
	public func obfuscate(source: String) throws -> String {
		return try algorithm.obfuscate(source:source)
	}
	
	public func unObfuscate(source: String) throws -> String {
		return try algorithm.unObfuscate(source:source)
	}
}
