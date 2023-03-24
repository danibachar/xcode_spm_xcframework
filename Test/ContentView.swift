//
//  ContentView.swift
//  Test
//
//  Created by Daniel Bachar on 3/18/23.
//

import SwiftUI
import A
import B
import C

struct ContentView: View {
    var a = A()
    var b = B()
    var c = C()
    
    var body: some View {
        VStack {
            Grid {
                // Instance reached through A directly
                row(with: "A static from A", and: "\(Unmanaged.passUnretained(A.myStatisA).toOpaque().debugDescription)")
                // Instance reached though C
                row(with: "A static from C", and: "\(Unmanaged.passUnretained(C.aVar).toOpaque().debugDescription)")
            }
        }
        .padding()
    }
    
    private func row(with title: String, and content: String) -> some View {
        GridRow {
            Text(title)
                .multilineTextAlignment(.center)
            Text(content)
                .font(.callout)
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
