//
//  Dictionary.swift
//  Today2
//
//  Created by Ved Joshi on 1/22/21.
//

extension Dictionary {
    public init(keys: [Key], values: [Value]) {
        precondition(keys.count == values.count)

        self.init()

        for (index, key) in keys.enumerated() {
            self[key] = values[index]
        }
    }
}
