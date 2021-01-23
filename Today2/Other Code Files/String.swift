//
//  String.swift
//  today
//
//  Created by Ved Joshi on 11/25/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import Foundation
extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    func removingLeadingSpaces() -> String {
           guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
               return self
           }
           return String(self[index...])
    }
    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
            let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
            return String(String.UnicodeScalarView(passed))
        }

        func removeCharacters(from: String) -> String {
            return removeCharacters(from: CharacterSet(charactersIn: from))
        }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
