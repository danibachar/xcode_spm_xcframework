//
//  C.swift
//  C
//
//  Created by Daniel Bachar on 3/21/23.
//

import Foundation
import A
import B

public class C {
    public let val: String
    public static let aVar = A.myStatisA
    public let a = A()
    public let b = B()
    public init(val: String = UUID().uuidString) {
        self.val = val
    }
}

