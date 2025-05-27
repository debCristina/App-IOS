//
//  ShoppingListDetailView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ShoppingListDetailView: View {
    let list: ShoppingList
    @State private var showingAddItemSheet = false
    @State private var showingEditItemSheet =
    false
    @State private var selectedItem: ShoppingItem? = nil
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("Total da lista:")
                        .font(.custom("Baloo2-SemiBold", size: 20))
                    
                    Text(list.totalLista, format: .currency(code: "BRL"))
                        .font(.custom("Baloo2-SemiBold", size: 20))
                    
                    Spacer()
                    
                    Button(action:{
                        showingAddItemSheet = true

                    }){
                        Image(systemName: "plus")
                            .bold()
                            .frame(width: 34, height: 34)
                            .background(Color.accent)
                            .foregroundStyle(.black)
                            .clipShape(Circle())
                    }
                }                .padding(.horizontal)

                Divider()
                
                ForEach(list.items) { item in
                    Button {
                        selectedItem = item
                        showingEditItemSheet = true
                    } label: {
                        ShoppingItemRow(item: item)
                    }
                    Divider()
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
        .navigationTitle(list.title)
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingAddItemSheet) {
            AddItemView()
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $showingEditItemSheet) {
            if let item = selectedItem {
                ItemToEdit(item: item)
                    .presentationDetents([.medium])
            }
        }
    }
        
}

#Preview {
    let mockList = ShoppingList(
        title: "Mercado",
        itemCount: 2,
        items: [
            ShoppingItem(name: "Ovo", quantity: 12, medida: "un", valorUnitário: 0.50, isChecked: false),
            ShoppingItem(name: "Leite", quantity: 2, medida: "L", valorUnitário: 3.80, isChecked: true)
        ],
        totalLista: 0.00
    )
    ShoppingListDetailView(list: mockList)
    
}
