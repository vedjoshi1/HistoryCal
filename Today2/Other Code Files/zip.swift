//
//  zip.swift
//  Today2
//
//  Created by Ved Joshi on 1/20/21.
//

import Foundation
// zip
// Given two sequences, return a sequence of 2-tuples (pairs)
public func zip<A: SequenceType, B: SequenceType>(a: A, b: B)
    -> ZipSequence<A, B>
{
    return ZipSequence(a, b)
}

// Lazy sequence of tuples created from values from two other sequences
public struct ZipSequence<A: SequenceType, B: SequenceType>: SequenceType {
    private var a: A
    private var b: B
    
    public init (_ a: A, _ b: B) {
        self.a = a
        self.b = b
    }
    
    public func generate() -> ZipGenerator<A.Generator, B.Generator> {
        return ZipGenerator(a.generate(), b.generate())
    }
}

// Generator that creates tuples of values from two other generators
public struct ZipGenerator<A: GeneratorType, B: GeneratorType>: GeneratorType {
    private var a: A
    private var b: B
    
    public init(_ a: A, _ b: B) {
        self.a = a
        self.b = b
    }
    
    mutating public func next() -> (A.Element, B.Element)? {
        switch (a.next(), b.next()) {
        case let (.Some(aValue), .Some(bValue)):
            return (aValue, bValue)
        default:
            return nil
        }
    }
}


// zip3
// Given three sequences, return a sequence of 3-tuples
public func zip3<A: SequenceType, B: SequenceType, C: SequenceType>(a: A, b: B, c: C)
    -> ZipSequence3<A, B, C>
{
    return ZipSequence3(a, b, c)
}

// Sequence of tuples created from values from three other sequences
public struct ZipSequence3<A: SequenceType, B: SequenceType, C: SequenceType>: SequenceType {
    private var a: A
    private var b: B
    private var c: C
    
    public init (_ a: A, _ b: B, _ c: C) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    public func generate() -> ZipGenerator3<A.Generator, B.Generator, C.Generator> {
        return ZipGenerator3(a.generate(), b.generate(), c.generate())
    }
}

// Generator that creates tuples of values from three other generators
public struct ZipGenerator3<A: GeneratorType, B: GeneratorType, C: GeneratorType>: GeneratorType {
    private var a: A
    private var b: B
    private var c: C
    
    public init(_ a: A, _ b: B, _ c: C) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    mutating public func next() -> (A.Element, B.Element, C.Element)? {
        switch (a.next(), b.next(), c.next()) {
        case let (.Some(aValue), .Some(bValue), .Some(cValue)):
            return (aValue, bValue, cValue)
        default:
            return nil
        }
    }
}


// Examples
let numbers = [0, 1, 2, 3, 4]
let names = ["Zero", "One", "Two", "Three"]
let letters = ["A", "B", "C"]

let result = zip(numbers, names)
let printableResult = ", ".join(map(result) { "(\($0.0), \($0.1))" })
println("result: \(printableResult)")
// result: (0, Zero), (1, One), (2, Two), (3, Three)
let result3 = zip3(numbers, names, letters)
let printableResult3 = ", ".join(map(result3) { "(\($0.0), \($0.1), \($0.2))" })
println("result3: \(printableResult3)")
// result3: (0, Zero, A), (1, One, B), (2, Two, C)
let resultOne = filter(result3) { $0.1 == "One" }
let printableResultOne = ", ".join(resultOne.map { "(\($0.0), \($0.1), \($0.2))" })
println("resultOne: \(printableResultOne)")
// resultOne: (1, One, B)

// Note: Standard Swift Library provides Zip2, which is a struct
// but we can use it almost like a function.
let zip2Result = Zip2(numbers, names)
let printableZip2Result = ", ".join(map(zip2Result) { "(\($0.0), \($0.1))" })
println("zip2Result: \(printableZip2Result)")
// result: (0, Zero), (1, One), (2, Two), (3, Three)
