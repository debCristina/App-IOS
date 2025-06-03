//
//  RecipeDetailView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 21/05/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    
    @State private var selectedSection = 0
    @Environment(\.dismiss) private var dismiss
    @State private var showingSheet = false
    @EnvironmentObject var favoritesManager : FavoritesManager
    @EnvironmentObject var shoppingViewModel: ShoppingListViewModel
    @State private var toastID = UUID()
    @State private var showToast = false
    @State private var novaListaCriada: ShoppingList?
    @State private var navigateToShoppingLists = false
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(){
                    ZStack (alignment: .leading){
                        Color(.white).ignoresSafeArea(edges: .top)
                        ZStack {
                            RecipeDetailImage(recipe: recipe)
                            VStack{
                                HStack(alignment: .top){
                                    Button(action:{
                                        dismiss()
                                    }){
                                        Image(systemName: "chevron.left")
                                            .bold()
                                            .frame(width: 34, height: 34)
                                            .background(Color.accent)
                                            .foregroundStyle(.black)
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                    Button(action:{
                                        favoritesManager.toggleFavorite(recipe)
                                    }){
                                        Image(systemName: favoritesManager.isFavorite(recipe) ? "heart.fill" : "heart.fill")
                                            .foregroundColor(favoritesManager.isFavorite(recipe) ? .black : .white)
                                            .bold()
                                            .frame(width: 34, height: 34)
                                            .background(Color.accent)
                                            .clipShape(Circle())
                                    }
                                    Button(action:{
                                        showingSheet.toggle()
                                    }){
                                        Image(systemName: "lightbulb.max")
                                            .bold()
                                            .frame(width: 34, height: 34)
                                            .background(Color.accent)
                                            .foregroundStyle(.black)
                                            .clipShape(Circle())
                                    }.sheet(isPresented: $showingSheet) {
                                        RecipeDetailTip()
                                            .presentationDetents([.medium, .large])
                                    }
                                }
                                .padding(.horizontal, 32)
                                .padding(.top, 59)
                                Spacer()
                            }
                        }
                    }
                    VStack(alignment: .leading){
                        RecipeDetailNameView(recipe: recipe)
                            .padding(.horizontal)
                        
                        RecipeSegmentedPicker(recipe: recipe)
                            .padding(.horizontal)
                    }
                    
                    
                    
                    Button(action: {
                        let items = recipe.ingredients.map { ri in
                            ShoppingItem(
                                name: ri.ingredient.name,
                                quantity: Int(ri.quantity ?? 1),
                                medida: ri.unit?.rawValue ?? "",
                                valorUnitario: 0.0,
                                isChecked: false
                            )
                        }
                        
                        let novaLista = ShoppingList(
                            title: recipe.name,
                            itemCount: items.reduce(0) { $0 + $1.quantity },
                            items: items,
                            totalLista: 0.0
                        )
                        
                        shoppingViewModel.addList(novaLista)
                        novaListaCriada = novaLista
                        
                        toastID = UUID()
                        withAnimation {
                            showToast = true
                        }
                        
                    }) {
                        Text("Criar lista de compras")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.top)
                    }.padding(.horizontal)
                    
                    
                    NavigationLink(
                        destination: ShoppingListView()
                            .environmentObject(shoppingViewModel),
                        isActive: $navigateToShoppingLists,
                        label: { EmptyView() }
                    )
                    .hidden()
                }.navigationBarBackButtonHidden(true)
            }.ignoresSafeArea(edges: .top)
                .zIndex(0)
            
            if showToast {
                ToastView(message: "Lista criada com sucesso!") {
                    navigateToShoppingLists = true
                    showToast = false
                }
                .id(toastID)
                .frame(maxWidth: .infinity, alignment: .top)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showToast = false
                        }
                    }
                }
                .animation(.easeInOut, value: showToast)
                .zIndex(1)
            }
        }.toolbar(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
    }
}
