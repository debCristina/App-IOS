//
//  ShoppingList.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import Foundation

struct ShoppingList: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var itemCount: Int
    var items: [ShoppingItem]
    var totalLista : Double
    
    
}
