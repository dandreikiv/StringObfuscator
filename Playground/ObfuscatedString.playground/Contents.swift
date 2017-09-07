import Foundation

/*:
## Overview
- According to the assignement there was a requiremnt to implement a class which takes a string and creates an obfuscated version of it. The **ObfuscatedString** wrapper doesn't make a copy of an original string. It takes a string and crated an obfuscated string out of it and stores it internaly.

- During implementation it was decided to use [Strategy Design Pattern](https://en.wikipedia.org/wiki/Strategy_pattern) which gives a possibility to use different algorithms for string obfuscation.
*/
let originalText = "NL88INGB0123456789"
print("Original text: \(originalText)")

let obfuscatedString = ObfuscatedString(algorithm: CharObfuscator())
do {
	try obfuscatedString.setString(string: originalText)
	print(obfuscatedString.obfusated())
	
	let originalStringCopy = try obfuscatedString.originalString()
	print("Original string from obfuscated: \(originalStringCopy)")
} catch {
	print("Unexpected exception happend")
}





