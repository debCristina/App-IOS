//
//  CardListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import SwiftUI

struct CardListView: View {
    let title: String
    let itemCount: Int
    
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    
    @State private var showActions: Bool = false
    let onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(spacing: 16) {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .bold()
                    .frame(width: 48, height: 48)
                    .font(.custom("Baloo2-Bold", size: 22))
                    .background(Color.accent)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: -6) {
                    Text(title)
                        .font(.custom("Baloo2-SemiBold", size: 20))
                        .foregroundStyle(Color("TextColor"))
                    Text("\(itemCount) itens")
                        .font(.custom("Baloo2-Regular", size: 14))
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.second, lineWidth: 5)
            )
            .background(Color.white)
            
            .cornerRadius(10)
            .offset(x: dragOffset.width + position.width)
            .animation(.linear, value: dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        if dragOffset.width < -200 {
                            // Primeiro, move o card para fora da tela
                            withAnimation {
                                position.width = -UIScreen.main.bounds.width
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                onDelete()
                            }
                        } else if dragOffset.width < -40 {
                            withAnimation {
                                position.width = -70
                            }
                        } else {
                            withAnimation {
                                position.width = 0
                            }
                        }
                        dragOffset = .zero
                    }
            )
            
            .background {
                let totalOffset = dragOffset.width + position.width
                let maxWidth = UIScreen.main.bounds.width - 32
                
                HStack {
                    Spacer()
                    ZStack(alignment: .trailing) {
                        Color.red
                            .cornerRadius(10)
                        option(
                            iconName: "trash",
                            iconColor: .white,
                            action: {
                                withAnimation {
                                    position.width = -UIScreen.main.bounds.width
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    onDelete()
                                }
                            },
                            offsetX: totalOffset
                        )
                        .padding(.trailing, 12)
                    }
                    .frame(width: min(max(-totalOffset, 0), maxWidth))
                    .cornerRadius(10)
                    .opacity(totalOffset < 0 ? 1 : 0)
                    .animation(.linear, value: totalOffset)
                
                }
                .padding(.trailing, 12)
            }
            
        }.padding(.horizontal)
    }
}

struct option: View {
    var iconName: String
    var iconColor: Color
    var action: () -> Void
    var offsetX: CGFloat
    var body: some View {
        let progress = min(max(-offsetX / 130, 0), 1)
        
        Button {
            action()
        } label: {
            ZStack {
                Circle().frame(width: 34, height: 34)
                    .foregroundStyle(iconColor.opacity(0.2))
                Image(systemName: iconName).resizable().scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(iconColor)
            }
        }
        .opacity(progress)
        .scaleEffect(progress)
        .animation(.spring, value: progress)
        
    }
}
