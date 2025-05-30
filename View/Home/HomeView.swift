//
//  RecipesView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 18/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @EnvironmentObject var viewModel: RecipesViewModel
    
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        ScrollView {
            if searchText.isEmpty {
                HomeCategoriesView()
            } else {
                VStack(alignment: .leading){
                    Text("Resultados para \"\(searchText)\"")
                        .font(.custom("Baloo2-SemiBold", size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Divider( )
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            CardCategoryRecipesView(recipe: recipe)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
        .navigationTitle("Receitas")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    // filtro
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }
                Button {
                    // adicionar
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .searchable(text: $searchText, prompt: "Buscar receitas") {
            if !searchText.isEmpty {
                ForEach(filteredRecipes) { recipe in
                    HStack(spacing: 0) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.accentColor)
                        Text(recipe.name)
                            .padding(.horizontal)
                            .padding(.top, 4)
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                            .searchCompletion(recipe.name)
                    }
                }
                .padding()
            }
        }
    }
}

