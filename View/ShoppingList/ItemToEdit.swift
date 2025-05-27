//
//  ItemToEdit.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ItemToEdit: View {
    @State var item: ShoppingItem
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome", text: $item.name)
//                    TextField("Quantidade", value: $item.quantity)
//                        .keyboardType(.numberPad)
                    TextField("Medida", text: $item.medida)
//                    TextField("Valor unitário", value: $item.valorUnitario, format: .number)
//                        .keyboardType(.decimalPad)
                }
            }
            .background(Color.white)
            .navigationTitle("Editar item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundColor(.gray)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        dismiss()
                    }
                    .foregroundColor(.orange)
                }
            }
            
        }
    }
}

#Preview {
    let mockItem = ShoppingItem(name: "Ovo", quantity: 12, medida: "un", valorUnitário: 0.50, isChecked: false)
    return ItemToEdit(item: mockItem)
}
