//
//  ToastView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 31/05/25.
//

import SwiftUI

struct ToastView: View {
    let message: String
    let action: () -> Void
    
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            if isVisible {
                HStack(spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.accent)
                    
                    Text(message)
                        .foregroundColor(.black)
                        .font(.custom("Baloo2-SemiBold", size: 16))
                    
                    Spacer()
                    
                    Button(action: action) {
                        Text("Ver lista")
                            .foregroundColor(.black)
                            .bold()
                            .font(.custom("Baloo2-Regular", size: 16))
                    }
                }
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(12)
                .padding(.horizontal)
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            withAnimation {
                isVisible = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isVisible = false
                }
            }
        }
    }
}

#Preview {
    ToastView(message: "Lista criada com sucesso!") {
        print("Ação do botão Ver lista")
    }
}
