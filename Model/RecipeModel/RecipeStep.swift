//
//  RecipeStep.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 22/05/25.
//

import Foundation

struct RecipeStep: Identifiable, Equatable, Hashable {
    var id = UUID()
    let number: Int
    let instruction: String
    let ingredients: [RecipeIngredient]
}
