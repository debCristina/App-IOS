//
//  AddListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct AddListView: View {
    @State private var nome = ""
    @Environment(\.dismiss) var dismiss
    var onAdd: (ShoppingList) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome", text: $nome)
                }
            }
            .background(Color.white)
            .navigationTitle("Adicionar lista")
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
                        let novaLista = ShoppingList(
                            title: nome,
                            itemCount: 0,
                            items: [],
                            totalLista: 0.0
                        )
                        onAdd(novaLista)
                        dismiss()
                    }
                    .foregroundColor(.orange)
                }
            }
        }
        .presentationDetents([.medium])
    }
}
