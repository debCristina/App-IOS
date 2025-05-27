//
//  RecipesViewModel.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

struct Category: Identifiable {
    var id = UUID( )
    let name : String
    let recipes: [Recipe]
}
