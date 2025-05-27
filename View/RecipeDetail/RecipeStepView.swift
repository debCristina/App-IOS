//
//  RecipeStepView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 22/05/25.
//

import SwiftUI

struct RecipeStepView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Preparo")
                .font(.custom("Baloo2-SemiBold", size: 20))
            
            VStack{
                ForEach(recipe.steps) { step in
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Passo \(step.number)")
                            .font(.custom("Baloo2-SemiBold", size: 18))
                        
                        Text(step.instruction)
                            .font(.custom("Baloo2-Regular", size: 16))
                        
                        if !step.ingredients.isEmpty {
                            let columns = [GridItem(.adaptive(minimum: 100), spacing: 6)]
                            LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
                                ForEach(step.ingredients, id: \.id) { ingredient in
                                    let quantityText = ingredient.quantity != nil ? "\(ingredient.quantity!)" : "a gosto"
                                    Text("\(ingredient.ingredient.name) (\(quantityText))")
                                        .font(.custom("Baloo2-Regular", size: 11))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color("SecondColor"))
                                        .foregroundColor(.black)
                                        .clipShape(Capsule())
                                }
                            }
                            .padding(.bottom, 4)
                        }
                        Divider()
                    }
                }.padding(.vertical, 4)
            }
        }.padding()
    }
}


