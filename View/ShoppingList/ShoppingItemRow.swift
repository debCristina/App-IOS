//
//  ShoppingItemRow.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ShoppingItemRow: View {
    let item: ShoppingItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -2) {
                Text(item.name)
                    .font(.custom("Baloo2-Bold", size: 18))
                    .foregroundStyle(Color.black)

                Text("Quantidade: \(item.quantity)")
                    .font(.custom("Baloo2-Regular", size: 16))
                    .foregroundStyle(Color.black)
                Text("Valor unitário: R$ \(item.valorUnitário, specifier: "%.2f")")
                    .font(.custom("Baloo2-Regular", size: 16))
                    .foregroundStyle(Color.black)

            }
            .padding(.horizontal)
            
            Spacer()
            
            Circle()
                .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                .frame(width: 30, height: 30)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)
    }
}

#Preview {
    let mockItem = ShoppingItem(name: "Leite", quantity: 2, medida: "L", valorUnitário: 4.50, isChecked: false)
    return ShoppingItemRow(item: mockItem)
}
