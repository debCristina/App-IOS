//
//  FavoritesManager.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 29/05/25.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favorites: Set<UUID> = []
    
    func toggleFavorite(_ recipe: Recipe) {
        if favorites.contains(recipe.id) {
            favorites.remove(recipe.id)
        } else {
            favorites.insert(recipe.id)
        }
    }
    
    func isFavorite(_ recipe: Recipe) -> Bool {
        favorites.contains(recipe.id)
    }
}

