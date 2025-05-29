//
//  CategoryRecipesView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.


import SwiftUI

struct CategoryRecipesView: View {
    let category: CategoryType
    let recipes: [Recipe]
        
    var body: some View {
        ScrollView {
            LazyVStack() {
                ForEach(recipes) { recipe in
//                    NavigationLink(destination: RecipeDetailView(recipe: recipe)
//                        .navigationBarBackButtonHidden())
//                    {
//                        CardCategoryRecipesView(recipe: recipe)
//                            .padding(.horizontal)
//                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(category.displayName)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    CategoryRecipesView(
        category: .lunch,
        recipes: [
            Recipe(
                name: "Strogonoff",
                category: .lunch,
                image: "strogonoff",
                ingredients: [],
                time: Time(value: 20, unit: .minutes),
                description: "Delicioso strogonoff de frango.",
                steps: [],
                isFavorite: true
            )
        ]
    )
}
