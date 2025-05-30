//
//  RecipesViewModel.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import Foundation

enum CategoryType: String, CaseIterable, Identifiable {
    case all
    case breakfast
    case lunch
    case dessert
    case drinks
    case favorites
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .all: return "Todos"
        case .breakfast: return "Café da Manhã"
        case .lunch: return "Almoço"
        case .dessert: return "Sobremesa"
        case .drinks: return "Bebidas"
        case .favorites: return "Favoritas"
        }
    }
}
