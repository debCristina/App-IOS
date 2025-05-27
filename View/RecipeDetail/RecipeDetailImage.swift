//
//  RecipeDetailImage.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 21/05/25.
////
//
import SwiftUI

struct RecipeDetailImage: View {
    let recipe : Recipe
    var body: some View {
        Image(recipe.image)
            .resizable()
            .frame(width: 420, height: 370)
            .aspectRatio(contentMode: .fill)
            .overlay(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color("SecondColor"), location: 0.00),
                        Gradient.Stop(color: .black.opacity(0), location: 0.20),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()
        
    }
}

//#Preview {
//    RecipeDetailView(recipe: <#T##Recipe#>)
//}

