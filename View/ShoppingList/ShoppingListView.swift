//
//  ShoppingListViewModel .swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import SwiftUI

struct ShoppingListView: View {
    let lists: [ShoppingList] = [
        ShoppingList(
            title: "Mercado",
            itemCount: 2,
            items: [
                ShoppingItem(name: "Ovo", quantity: 12, medida: "un", valorUnitário: 0.50, isChecked: false),
                ShoppingItem(name: "Leite", quantity: 2, medida: "L", valorUnitário: 3.80, isChecked: true)
            ],
            totalLista: 0.00
        )
        ,
        ShoppingList(
            title: "Mercado",
            itemCount: 2,
            items: [
                ShoppingItem(name: "Ovo", quantity: 12, medida: "un", valorUnitário: 0.50, isChecked: false),
                ShoppingItem(name: "Leite", quantity: 2, medida: "L", valorUnitário: 3.80, isChecked: true)
            ],
            totalLista: 0.00
        ),
        ShoppingList(
            title: "Mercado",
            itemCount: 2,
            items: [
                ShoppingItem(name: "Ovo", quantity: 12, medida: "un", valorUnitário: 0.50, isChecked: false),
                ShoppingItem(name: "Leite", quantity: 2, medida: "L", valorUnitário: 3.80, isChecked: true)
            ],
            totalLista: 0.00
        )
    ]
    @State private var showingAddListSheet = false

    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                ForEach(lists) { list in
                    NavigationLink(destination: ShoppingListDetailView(list: list)) {
                        
                        CardListView(title: list.title, itemCount: list.itemCount)
                    }
                    
                }
            }
            .padding()
        }.navigationTitle("Minhas Listas")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        showingAddListSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddListSheet) {
                AddListView()
                    .presentationDetents([.medium])

            }
            
    }
}

#Preview {
    ShoppingListView()
}
