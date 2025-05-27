//
//  Ingredient.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    var id = UUID()
    let name: String
}
