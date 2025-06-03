//
//  ShoppingListViewModel.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import Foundation

class ShoppingListViewModel: ObservableObject {
    @Published var lists: [ShoppingList] = []
    
    func addList(_ newList: ShoppingList) {
        lists.append(newList)
    }
    
    func addItem(_ item: ShoppingItem, to list: ShoppingList) {
        if let index = lists.firstIndex(where: { $0.id == list.id }) {
            var updatedList = lists[index]
            updatedList.items.append(item)
            updatedList.itemCount = updatedList.items.reduce(0) { $0 + $1.quantity }
            updatedList.totalLista += item.valorUnitario * Double(item.quantity)
            lists[index] = updatedList
        }
    }
    
    func deleteList(_ list: ShoppingList) {
        if let index = lists.firstIndex(where: { $0.id == list.id }) {
            lists.remove(at: index)
        }
    }
    
    func deleteItem(_ item: ShoppingItem, from list: ShoppingList) {
        guard let listIndex = lists.firstIndex(where: { $0.id == list.id }) else { return }
        var updatedList = lists[listIndex]
        
        if let itemIndex = updatedList.items.firstIndex(where: { $0.id == item.id }) {
            let itemToRemove = updatedList.items[itemIndex]
            updatedList.items.remove(at: itemIndex)
            updatedList.itemCount -= itemToRemove.quantity
            updatedList.totalLista -= itemToRemove.valorUnitario * Double(itemToRemove.quantity)
            lists[listIndex] = updatedList
        }
    }
    
    func toggleCheck(for item: ShoppingItem) {
        guard let listIndex = lists.firstIndex(where: { $0.items.contains(where: { $0.id == item.id }) }),
              let itemIndex = lists[listIndex].items.firstIndex(where: { $0.id == item.id }) else { return }
        
        lists[listIndex].items[itemIndex].isChecked.toggle()
    }
}
