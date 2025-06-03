//
//  ShoppingListDetailView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 25/05/25.
//

import SwiftUI

struct ShoppingListDetailView: View {
    @State var viewModel: ShoppingListViewModel
    var list: ShoppingList
    @State private var showingAddItemSheet = false
    @State private var showingEditItemSheet = false
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
                
                if let listIndex = viewModel.lists.firstIndex(where: { $0.id == list.id }) {
                    if viewModel.lists[listIndex].items.isEmpty {
                        VStack {
                            Spacer() // empurra para baixo
                            VStack(spacing: 5) {
                                Image(systemName: "tray.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.gray.opacity(0.5))
                                
                                Text("Nenhum item adicionado.\nToque em + para adicionar.")
                                    .font(.custom("Baloo2-Regular", size: 18))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    .padding(.vertical, 32)
                                    .frame(maxWidth: .infinity)
                            }
                            Spacer()
                        }
                        .frame(maxHeight: .infinity)
                    } else {
                        ForEach($viewModel.lists[listIndex].items) { $item in
                            Button {
                                selectedItem = item
                            } label: {
                                ShoppingItemRow(item: item,
                                                onDelete: {
                                    withAnimation {
                                        viewModel.deleteItem(item, from: list)
                                    }
                                })
                            }
                            .transition(.asymmetric(
                                insertion: .move(edge: .top),
                                removal: .move(edge: .leading)
                                    .combined(with: .scale(scale: 0, anchor: .topLeading))
                                    .combined(with: .opacity)
                            ))
                            Divider()
                        }.animation(.easeInOut, value: viewModel.lists)

                    }
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
        .navigationTitle(list.title)
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingAddItemSheet) {
            AddItemView { newItem in
                viewModel.addItem(newItem, to: list)
            }
            .presentationDetents([.medium])
        }
        .sheet(item: $selectedItem) { selectedItem in
            if let listIndex = viewModel.lists.firstIndex(where: { $0.id == list.id }),
               let itemIndex = viewModel.lists[listIndex].items.firstIndex(where: { $0.id == selectedItem.id }) {
                
                ItemToEdit(item: $viewModel.lists[listIndex].items[itemIndex])
                    .presentationDetents([.medium])
                    .id(selectedItem.id)
            }
        }
    }
}

