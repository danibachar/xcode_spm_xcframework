//
//  A.swift
//  Test
//
//  Created by Daniel Bachar on 3/20/23.
//

import Foundation

public class A {
    public let val: String
    public init(val: String = UUID().uuidString) {
        self.val = val
    }
}

extension A {
    public static let myStatisA = A()
}
