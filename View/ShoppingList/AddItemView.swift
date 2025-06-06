//
//  AddListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var nome = ""
    @State private var quantidade = ""
    @State private var medida = ""
    @State private var valorUnitario = ""
    
    var onAdd: (ShoppingItem) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome", text: $nome)
                    TextField("Quantidade", text: $quantidade)
                        .keyboardType(.numberPad)
                    TextField("Medida", text: $medida)
                    TextField("Valor unitário", text: $valorUnitario)
                        .keyboardType(.decimalPad)
                }
            }
            .background(Color.white)
            .navigationTitle("Adicionar item")
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
                        let valorFormatado = valorUnitario.replacingOccurrences(of: ",", with: ".")
                        
                        let novoItem = ShoppingItem(
                            name: nome,
                            quantity: Int(quantidade) ?? 0,
                            medida: medida,
                            valorUnitario: Double(valorFormatado) ?? 0.0,
                            isChecked: false
                        )
                        onAdd(novoItem)
                        dismiss()
                    }
                    .foregroundColor(.orange)
                }
            }
            
        }
    }
}

#Preview {
    AddItemView { _ in }
}
