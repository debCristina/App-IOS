//
//  Recipes.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

struct Recipe: Identifiable{
    var id = UUID()
    let name: String
    let image: String
    let ingredients: [RecipeIngredient]
    let time: Time
    let description: String
    let steps: [RecipeStep]
    var isFavorite: Bool = false
    
}
