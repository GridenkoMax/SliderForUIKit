//
//  SwiftUIView.swift
//  SliderForUIKit
//
//  Created by Maxim Gridenko on 22.12.2023.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {
    @Binding var value: Float
    var guessableNumber: Int
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = value
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        updateOpacity(uiView)
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, guessableNumber: guessableNumber)
    }
    
    final class Coordinator: NSObject {
        @Binding var value: Float
        var guessableNumber: Int
        
        init(value: Binding<Float>, guessableNumber: Int) {
            _value = value
            self.guessableNumber = guessableNumber
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = round(sender.value)
            
        }
    }
}
private extension UISliderView {
    func updateOpacity(_ slider: UISlider) {
        let distance = abs(value - Float(guessableNumber))
        let maxDistance = 50.0
        let opacity = CGFloat((maxDistance - Double(distance)) / maxDistance)
        
        slider.thumbTintColor = .red.withAlphaComponent(opacity)
    }
}


