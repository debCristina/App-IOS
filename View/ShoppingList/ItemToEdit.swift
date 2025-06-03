//
//  ItemToEdit.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ItemToEdit: View {
    @Binding var item: ShoppingItem
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome", text: $item.name)
                    TextField("Quantidade", value: $item.quantity, format: .number.precision(.integerLength(3)))
                        .keyboardType(.numberPad)
                    TextField("Medida", text: $item.medida)
                    TextField("Valor unitário", value: $item.valorUnitario, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.decimalPad)
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
