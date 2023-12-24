//
//  ContentView.swift
//  SliderForUIKit
//
//  Created by Maxim Gridenko on 22.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var value: Float = Float.random(in: 0...100)
    @State var guessableNumber = Int.random(in: 0...100)
    @State var showAlert = false
    var colorGradient = LinearGradient(colors: [.red, .purple], startPoint: .top , endPoint: .bottom)
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                
                Text("Подвиньте слайдер, как можно ближе к \(guessableNumber) ")
                HStack {
                    Text("0")
                        .font(.title)
                    UISliderView(value: $value, guessableNumber: guessableNumber)
                    
                    Text("100")
                        .font(.title)
                }
                CustomButtonView(
                    buttonLabel: "Проверь меня",
                    backgroundButton: colorGradient,
                    action: {
                        showAlert = true
                    }
                )
                .padding()
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Your Score "),
                        message: Text("\(computeScore())"),
                        dismissButton: .default(Text("OK"))
                    )})
                CustomButtonView(
                    buttonLabel: "Начать заново",
                    backgroundButton: colorGradient,
                    action: {
                        resetGame()
                    }
                )
            }
            .padding()
        }
    }
    private func computeScore() -> Int {
        let difference = abs(guessableNumber - lround(Double(value)))
        return 100 - difference
    }
    private func resetGame() {
        guessableNumber = Int.random(in: 0...100)
        value = Float.random(in: 0...100)
    }
}


#Preview {
    ContentView()
}
