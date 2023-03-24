//
//  B.swift
//  Test
//
//  Created by Daniel Bachar on 3/20/23.
//

import Foundation
import A

public class B {
    public let val: String
    public static let a = A()
    public init(val: String = UUID().uuidString) {
        self.val = val
    }
}
