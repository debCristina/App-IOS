//
//  CategoryListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import SwiftUI

struct HomeCategoriesView: View {
    @StateObject private var viewModel = RecipesViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.categories) { category in
                    if !viewModel.recipes.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            NavigationLink(destination: CategoryRecipesView(category: category)) {
                                HStack {
                                    Text(category.name)
                                        .font(.custom("Baloo2-SemiBold", size: 22))
                                        .foregroundStyle(Color("TextColor"))
                                    Image(systemName: "chevron.right")
                                        .bold()
                                }
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.recipes) { recipe in
                                        NavigationLink(destination: RecipeDetailView(recipe: recipe).navigationBarBackButtonHidden(true)) {
                                            HomeCardsView(recipe: recipe, isFavorite: recipe.isFavorite)
                                                .padding(5)
                                        }
                                    }
                                }
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
#Preview {
    HomeCategoriesView()
}
