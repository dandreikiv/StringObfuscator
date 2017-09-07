//
//  CharObfuscator.swift
//  Obfuscator
//
//  Created by dmytro.andreikiv@philips.com on 07/09/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class CharObfuscator: ObfuscationAlgorithm {
	
	// Obfuscated literals separator.
	private let separator = "#"
	
	/**
	 Reverted map will contain key:value pair created from the obfuscationMap,
	 where revertedMap key equals to obfuscationMap value, in order to simplify 
	 backward obfuscation.
	 */
	private var revertedMap: [String : String]
	
	private let obfuscationMap: [String : String] = [
		"A" : "1",
		"B" : "2",
		"C" : "3",
		"D" : "4",
		"E" : "5",
		"F" : "6",
		"G" : "7",
		"H" : "8",
		"I" : "9",
		"J" : "10",
		"K" : "11",
		"L" : "12",
		"M" : "13",
		"N" : "14",
		"O" : "15",
		"P" : "16",
		"Q" : "17",
		"R" : "18",
		"S" : "19",
		"T" : "20",
		"U" : "21",
		"W" : "22",
		"X" : "23",
		"Y" : "24",
		"Z" : "25",
		"a" : "26",
		"b" : "27",
		"c" : "28",
		"d" : "29",
		"e" : "30",
		"f" : "31",
		"g" : "32",
		"h" : "33",
		"i" : "34",
		"j" : "35",
		"k" : "36",
		"l" : "37",
		"m" : "38",
		"n" : "39",
		"o" : "40",
		"p" : "41",
		"q" : "42",
		"r" : "43",
		"s" : "44",
		"t" : "45",
		"u" : "46",
		"w" : "47",
		"x" : "48",
		"y" : "49",
		"z" : "50",
		"0" : "A1b",
		"1" : "B1c",
		"2" : "D2e",
		"3" : "E3f",
		"4" : "F4g",
		"5" : "G5h",
		"6" : "H6i",
		"7" : "I7j",
		"8" : "J8k",
		"9" : "K9l",
		"#" : "dash"
	]
	
	init() {
		revertedMap = [String : String]()
		for (key, value) in obfuscationMap {
			revertedMap[value] = key
		}
	}
	
	func obfuscate(source: String) throws -> String {
		var result = [String]()
		
		for index in source.characters.indices {
			let character = source[index]
			let key = String(character)
			let obfuscatedCharacter = obfuscationMap[key] ?? key
			result.append(obfuscatedCharacter)
		}
		return result.joined(separator:separator)
	}
	
	func unObfuscate(source: String) throws -> String {
		var result = [String]()
		
		for part in source.components(separatedBy: separator) {
			let original = revertedMap[part]
			result.append(original ?? part)
		}
		
		return result.joined(separator:"")
	}
}
