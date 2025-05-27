//
//  ShoppingItem.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import Foundation

struct ShoppingItem: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var quantity: Int
    var medida: String
    var valorUnitário: Double
    var isChecked: Bool
}
