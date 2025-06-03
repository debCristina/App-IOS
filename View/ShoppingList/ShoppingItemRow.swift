//
//  ShoppingItemRow.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ShoppingItemRow: View {
    let item: ShoppingItem
    @EnvironmentObject var shoppingViewModel: ShoppingListViewModel
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    @State private var showActions: Bool = false
    let onDelete: () -> Void
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading, spacing: -2) {
                    Text(item.name)
                        .font(.custom("Baloo2-Bold", size: 18))
                        .foregroundStyle(Color.black)
                    
                    Text("Quantidade: \(item.quantity)")
                        .font(.custom("Baloo2-Regular", size: 16))
                        .foregroundStyle(Color.black)
                    Text("Valor unitário: R$ \(item.valorUnitario, specifier: "%.2f")")
                        .font(.custom("Baloo2-Regular", size: 16))
                        .foregroundStyle(Color.black)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    shoppingViewModel.toggleCheck(for: item)
                }) {
                    Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(item.isChecked ? .accent : .gray)
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            .offset(x: dragOffset.width + position.width)
            .animation(.linear, value: dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        if dragOffset.width < -200 {
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
        }
    }
}

