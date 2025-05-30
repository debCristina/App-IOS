//
//  SearchManager.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 29/05/25.
//

import Foundation

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    var recipes: [Recipe] = []
    
    func filteredRecipes(from recipes: [Recipe]) -> [Recipe] {
        guard !searchText.isEmpty else { return recipes }
        return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var suggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            .map { $0.name }
    }
}
