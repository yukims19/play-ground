//
//  ContentView.swift
//  Hello World
//
//  Created by Yuki Li on 1/2/20.
//  Copyright © 2020 Yuki Li. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false

    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }

    var body: some View {
        VStack {
          HStack {
            VStack{
                Rectangle()
                    .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget))
                Text("Match this color")
            }

            VStack {
                Rectangle()
                    .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                HStack{
                    Text("R: \(Int(rGuess * 255.0))")
                    Text("G: \(Int(rGuess * 255.0))")
                    Text("B: \(Int(rGuess * 255.0))")
                }
            }
          }

            Button(action: {self.showAlert = true}){
                Text("Hit me button")
            }.alert(isPresented: $showAlert){
                Alert(title: Text("Score Here"), message: Text("\(computeScore())"))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .border(Color.black, width: 4)
            .cornerRadius(5)

            

          VStack {
            HStack{
                Text("Red slider")
                Slider(value: $rGuess)
            }.padding()
            
            HStack{
                Text("Green slider")
                Slider(value: $gGuess)
            }.padding()
            
            HStack{
                Text("Blue slider")
                Slider(value: $bGuess)
            }.padding()
          }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
