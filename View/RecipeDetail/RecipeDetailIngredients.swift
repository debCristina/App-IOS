//
//  RecipeDetailIngredients.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 21/05/25.
////
//
import SwiftUI

struct RecipeDetailIngredients: View {
    @EnvironmentObject var shoppingViewModel: ShoppingListViewModel
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Ingredientes")
                    .font(.custom("Baloo2-SemiBold", size: 20))
                Spacer()
                Text("Medida")
                    .font(.custom("Baloo2-SemiBold", size: 20))
            }.padding(.horizontal)
            VStack {
                ForEach(recipe.ingredients) { item in
                    HStack {
                        Image(systemName: "takeoutbag.and.cup.and.straw.fill") .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.second)
                            .padding(.vertical, 4)
                            .font(.custom("Baloo2-Regular", size: 16))
                        Text(item.ingredient.name)
                            .font(.custom("Baloo2-Regular", size: 16))
                        
                        Spacer()
                        
                        Text(item.quantity != nil && item.unit != nil ?
                             (item.quantity!.truncatingRemainder(dividingBy: 1) == 0 ?
                              "\(Int(item.quantity!)) \(item.unit!.rawValue)" :
                                "\(String(format: "%.1f", item.quantity!)) \(item.unit!.rawValue)") :
                                "a gosto")
                        .font(.custom("Baloo2-Regular", size: 16))
                        
                    }
                    Divider()
                }
                
//                VStack {
//                    Button {
//                        let items = recipe.ingredients.map { ri in
//                            ShoppingItem(
//                                name: ri.ingredient.name,
//                                quantity: Int(ri.quantity ?? 1),
//                                medida: ri.unit?.rawValue ?? "",
//                                valorUnitario: 0.0,
//                                isChecked: false
//                            )
//                        }
//
//                        let novaLista = ShoppingList(
//                            title: recipe.name,
//                            itemCount: items.reduce(0) { $0 + $1.quantity },
//                            items: items,
//                            totalLista: 0.0
//                        )
//
//                        shoppingViewModel.addList(novaLista)
//                    } label: {
//                        Label("Criar lista de compras", systemImage: "text.badge.plus")
//                            .font(.custom("Baloo2-SemiBold", size: 16))
//                            .padding()
//                            .frame(maxWidth: .infinity, maxHeight: 40)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.accent)
//                            )
//                            .foregroundStyle(Color("TextColor"))
//                    }
                
//                }.padding(.top)
//                    .padding(.bottom)
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)
//                    .padding(.top)
            }
            .padding(.horizontal)
        }.padding(.top)
    }
}

#Preview {
    let ingredient1 = Ingredient(name: "Farinha")
    let ingredient2 = Ingredient(name: "Açúcar")
    
    let ri1 = RecipeIngredient(ingredient: ingredient1, quantity: 1.0, unit: .tablespoons)
    let ri2 = RecipeIngredient(ingredient: ingredient2, quantity: 1.0, unit: .teaspoons)
    
    let ingredients = [ri1, ri2]
    
    RecipeDetailIngredients(
        recipe: Recipe(
            id: UUID(),
            name: "Strogonoff",
            category: .lunch,
            image: "strogonoff",
            ingredients: ingredients,
            time: Time(value: 10, unit: .minutes),
            description: "Delicioso sanduíche natural de frango.",
            steps: [],
            isFavorite: true
        ),
    )}
