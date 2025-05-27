//
//  RecipeDetailNameView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 22/05/25.
//

import SwiftUI

struct RecipeDetailNameView: View {
    let recipe : Recipe
    var body: some View {
        VStack(alignment: .leading) {
            HStack (spacing: 20){
                Text(recipe.name)
                    .font(.custom("Baloo2-Bold", size: 20))
                Text("\(recipe.time.value) \(recipe.time.unit.rawValue)")
                    .font(.custom("Baloo2-Regular", size: 14))
            }
            
        }.padding(.horizontal, 16)
    }
}

//#Preview {
//    return {
//        let ingredient1 = Ingredient(name: "Farinha")
//        let ingredient2 = Ingredient(name: "Açúcar")
//        
//        let ri1 = RecipeIngredient(ingredient: ingredient1, quantity: "1 xícara")
//        let ri2 = RecipeIngredient(ingredient: ingredient2, quantity: "1/2 xícara")
//        
//        let ingredientsList = [ri1, ri2]
//        
//        func matchIngredients(in text: String, from ingredients: [RecipeIngredient]) -> [RecipeIngredient] {
//            ingredients.filter { ingredient in
//                let name = ingredient.ingredient.name.lowercased()
//                return text.lowercased().contains(name)
//            }
//        }
//        
//        let instructions = [
//            "Misture a farinha com o açúcar.",
//            "Adicione leite e ovos e misture bem."
//        ]
//        
//        let steps = instructions.enumerated().map { (index, instruction) in
//            RecipeStep(
//                number: index + 1,
//                instruction: instruction,
//                ingredients: matchIngredients(in: instruction, from: ingredientsList)
//            )
//        }
//        
//        let mockRecipe = Recipe(
//            name: "Bolo de Chocolate",
//            image: "strogonoff",
//            ingredients: ingredientsList,
//            time: "45 minutos",
//            description: "Misture tudo e asse por 45 minutos.",
//            steps: steps
//        )
//        
//        return RecipeDetailNameView(recipe: mockRecipe)
//    }()
//}
