//
//  ShoppingListViewModel .swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var shoppingViewModel: ShoppingListViewModel
    @State private var showingAddListSheet = false
    
    @State private var searchText = ""
    
    var reversedLists: [ShoppingList] {
        shoppingViewModel.lists.reversed()
    }
    
    var filteredLists: [ShoppingList] {
        if searchText.isEmpty {
            return reversedLists
        } else {
            return reversedLists.filter { list in
                list.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            if shoppingViewModel.lists.isEmpty {
                VStack() {
                    Image(systemName: "tray.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Text("Nenhuma lista criada ainda.\nToque em + para adicionar.")
                        .font(.custom("Baloo2-Regular", size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.vertical, 32)
                }.frame(maxHeight: .infinity)
                
            } else {
                VStack {
                    ForEach(filteredLists, id: \.id) { list in
                        NavigationLink(destination: ShoppingListDetailView(viewModel: shoppingViewModel, list: list)) {
                            CardListView(
                                title: list.title,
                                itemCount: list.itemCount,
                                onDelete: {
                                    withAnimation {
                                        shoppingViewModel.deleteList(list)
                                    }
                                }
                            )
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .top),
                            removal: .move(edge: .leading)
                                .combined(with: .scale(scale: 0, anchor: .topLeading))
                                .combined(with: .opacity)
                        ))
                    }
                }
                .animation(.easeInOut, value: shoppingViewModel.lists)
            }
        }
        .navigationTitle("Minhas Listas")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingAddListSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .searchable(text: $searchText, prompt: "Buscar lista")
        .sheet(isPresented: $showingAddListSheet) {
            AddListView { newList in
                shoppingViewModel.addList(newList)
            }
        }
    }
}
        

