//
//  CustomButtonView.swift
//  SliderForUIKit
//
//  Created by Maxim Gridenko on 22.12.2023.
//

import SwiftUI

struct CustomButtonView: View {
    var buttonLabel = ""
    var backgroundButton: Color
    let action: () -> Void
    
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonLabel)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 300, height: 60)
        .background(backgroundButton)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 4))
    }
}

//#Preview {
//    CustomButtonView()
//}
