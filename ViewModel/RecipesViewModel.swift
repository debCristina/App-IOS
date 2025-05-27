//
//  RecipesViewModel.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

class RecipesViewModel: ObservableObject{
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var ingredients: [Ingredient] = []
    @Published var recipeIngredients: [RecipeIngredient] = []
    
    init() {
        loadMockData()
    }
    
    func loadMockData() {
        let ingredient1 = Ingredient(name: "Farinha")
        let ingredient2 = Ingredient(name: "Açúcar")
        
        let ri1 = RecipeIngredient(ingredient: ingredient1, quantity: 1.0, unit: .tablespoons)
        let ri2 = RecipeIngredient(ingredient: ingredient2, quantity: 1.0, unit: .teaspoons)
        
        let ingredientsList = [ri1, ri2]
        
//        let instructions = [
//           "Misture a farinha com o açúcar.",
//            "Adicione leite e ovos e misture bem."
//       ]
        
        let recipe1 = Recipe(name: "Strogonoff", image: "strogonoff", ingredients: ingredientsList, time: Time(value: 15, unit: .minutes), description: "Strogonoff de frango", steps: [RecipeStep(number: 1, instruction: "Misture os ingredientes secos.", ingredients: ingredientsList)])
        let recipe2 = Recipe(name: "Strogonoff", image: "strogonoff", ingredients: ingredientsList, time: Time(value: 15, unit: .minutes), description: "Strogonoff de frango", steps: [])
        let recipe3 = Recipe(name: "Strogonoff", image: "strogonoff", ingredients: ingredientsList, time: Time(value: 15, unit: .minutes), description: "Strogonoff de frango", steps: [])
        
        self.recipes = [recipe1, recipe2]
                             
        let category1 = Category(name: "Almoço", recipes: recipes)
        let category2 = Category(name: "Jantar", recipes: [recipe3])
        self.categories = [category1, category2]
        
    }
}
