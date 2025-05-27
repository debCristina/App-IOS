//
//  CategoryRecipesView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.


import SwiftUI

struct CategoryRecipesView: View {
    let category: Category
        
    var body: some View {
        ScrollView {
            LazyVStack() {
                ForEach(category.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)
                        .navigationBarBackButtonHidden())
                    {
                        CardCategoryRecipesView(recipe: recipe)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    let ingredient1 = Ingredient(name: "Farinha")
    let ingredient2 = Ingredient(name: "Açúcar")
    
    let ri1 = RecipeIngredient(ingredient: ingredient1, quantity: 1.0, unit: .tablespoons)
    let ri2 = RecipeIngredient(ingredient: ingredient2, quantity: 1.0, unit: .teaspoons)
    
    let ingredientsList = [ri1, ri2]
    
    CategoryRecipesView(
        
        category: Category(name: "Almoço", recipes: [Recipe(name: "Strogonoff", image: "strogonoff", ingredients: ingredientsList, time: Time(value: 15, unit: .minutes), description: "Strogonoff de frango", steps: [])])
    )
    
}
