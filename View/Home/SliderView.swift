//
//  SliderView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 30/05/25.
//

import SwiftUI

struct SliderView: View {
    private let range: ClosedRange<Double> = 5...65
    private let step: Double = 5
    
    @State private var tempo: Double = 10
    @State private var labelWidth: CGFloat = 0
    
    var selectedTimeLabel: String {
        if tempo >= 65 {
            return ""
        } else if tempo < 10 {
            return ""
        } else {
            return "\(Int(tempo)) min"
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            GeometryReader { geometry in
                let sliderWidth = geometry.size.width
                let percent = (tempo - range.lowerBound) / (range.upperBound - range.lowerBound)
                
                let horizontalPadding: CGFloat = 16
                
                let availableWidth = sliderWidth - 2 * horizontalPadding
                let thumbPosition = horizontalPadding + (availableWidth * percent)
                
                HStack(alignment: .center) {
                    if tempo == 5{
                        Text("5 min")
                            .font(.custom("Baloo2-Regular", size: 14))
                            .foregroundStyle(.accent)
                    } else {
                        Text("5 min")
                            .font(.custom("Baloo2-Regular", size: 14))
                    }
                    
                    
                    
                    GeometryReader { sliderGeo in
                        ZStack {
                            Slider(value: $tempo, in: range, step: step)
                                .accentColor(.orange)
                            
                            Text(selectedTimeLabel)
                                .font(.custom("Baloo2-Regular", size: 13))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .cornerRadius(6)
                                .shadow(radius: 1)
                                .background(GeometryReader { labelGeo in
                                    Color.clear
                                        .onAppear {
                                            labelWidth = labelGeo.size.width
                                        }
                                        .onChange(of: selectedTimeLabel) { _ in
                                            labelWidth = labelGeo.size.width
                                        }
                                })
                                .position(x: sliderGeo.size.width * CGFloat((tempo - range.lowerBound) / (range.upperBound - range.lowerBound)), y: -10)
                        }
                    }
                    .frame(height: 35)
                    if tempo == 65 {
                        Text("+1 hr")
                            .font(.custom("Baloo2-Regular", size: 14))
                            .foregroundStyle(.accent)
                        
                    } else {
                        Text("+1 hr")
                            .font(.custom("Baloo2-Regular", size: 14))
                    }
                    
                    
                }
                
            }
        }
    }
}


