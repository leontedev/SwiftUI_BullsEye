//
//  ContentView.swift
//  SwiftUI_BullsEye
//
//  Created by Mihai Leonte on 9/13/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let targetValue = Int.random(in: 1..<100)
    @State var guess: Float = 0.5
    @State var showAlert: Bool = false
    
    func computeScore() -> String {
        let difference: Int = abs(targetValue - Int(guess))
        if difference == 0 {
            return "Bull's Eye!"
        } else {
            return String(100 - difference)
        }
    }
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(targetValue)")
            HStack {
                Text("0")
                Slider(value: $guess, in: 0.0...100.0, step: 1.0)
                Text("100")
            }
            Button(action: { self.showAlert = true }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Score"), message: Text(computeScore()))
            }
        }.padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
