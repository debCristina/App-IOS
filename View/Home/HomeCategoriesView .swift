//
//  CategoryListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import SwiftUI

struct HomeCategoriesView: View {
    @StateObject private var viewModel = RecipesViewModel()
    @EnvironmentObject var favoritesManager: FavoritesManager

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(CategoryType.allCases.sorted {
                    if $0 == .favorites { return true }
                    if $1 == .favorites { return false }
                    return $0.displayName < $1.displayName
                }, id: \.self) { category in
                    
                    let recipes: [Recipe] = category == .favorites
                    ? viewModel.recipes.filter { favoritesManager.isFavorite($0) }
                    : viewModel.recipes.filter { $0.category == category }
                    
                    
                    if !recipes.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            NavigationLink(destination: CategoryRecipesView(category: category, recipes: recipes)) {
                                HStack {
                                    Text(category.displayName)
                                        .font(.custom("Baloo2-SemiBold", size: 22))
                                        .foregroundStyle(Color("TextColor"))
                                    Image(systemName: "chevron.right")
                                        .bold()
                                }
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(recipes) { recipe in
                                        NavigationLink(
                                            destination:
                                                RecipeDetailView(recipe: recipe)
                                                .navigationBarBackButtonHidden(true)
                                        ) {
                                            HomeCardsView(recipe: recipe)
                                            .padding(5)
                                        }
                                        
                                    }}
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
        }
    }
}

