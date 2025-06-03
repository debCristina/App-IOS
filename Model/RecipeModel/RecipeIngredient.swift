//
//  RecipeIngredient.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

struct RecipeIngredient: Identifiable, Equatable, Hashable{
    var id: UUID { ingredient.id }
    let ingredient : Ingredient
    let quantity: Double?
    let unit: Unit?
    
}
