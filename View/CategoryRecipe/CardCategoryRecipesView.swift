//
//  CardCategoryRecipesView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import SwiftUI

struct CardCategoryRecipesView: View {
    let recipe: Recipe

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 90)
                .clipped()
                .cornerRadius(14)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(recipe.name)
                        .font(.custom("Baloo2-Medium", size: 14))
                        .foregroundStyle(Color(.black))
                    
                    Spacer()
                    Text("\(recipe.time.value) \(recipe.time.unit.rawValue)")
                        .font(.custom("Baloo2-Regular", size: 12))
                        .foregroundColor(Color("Detail"))
                }
                
                Text(recipe.description)
                    .font(.custom("Baloo2-Regular", size: 12))
                    .foregroundColor(Color("Detail"))
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .center)
        .padding(.vertical, 4)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("SecondColor").opacity(1), lineWidth: 2))
//        .background(
//            RoundedRectangle(cornerRadius: 12)
//                .fill(Color.white)
//                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
//        )
        
    }
}


