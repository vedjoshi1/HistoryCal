//
//  Zip3Generator.swift
//  Today2
//
//  Created by Ved Joshi on 1/20/21.
//

import Foundation
struct Zip3Generator
    <
    A: IteratorProtocol,
    B: IteratorProtocol,
    C: IteratorProtocol
>: IteratorProtocol {

    private var first: A
    private var second: B
    private var third: C

    private var index = 0

    init(_ first: A, _ second: B, _ third: C) {
        self.first = first
        self.second = second
        self.third = third
    }

    // swiftlint:disable large_tuple
    mutating func next() -> (A.Element, B.Element, C.Element)? {
        if let first = first.next(), let second = second.next(), let third = third.next() {
            return (first, second, third)
        }
        return nil
    }
}

func zip<A: Sequence, B: Sequence, C: Sequence>(_ first: A, _ second: B, _ third: C) -> IteratorSequence<Zip3Generator<A.Iterator, B.Iterator, C.Iterator>> {
    return IteratorSequence(Zip3Generator(first.makeIterator(), second.makeIterator(), third.makeIterator()))
}
