//
//  RecipesCardView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 19/05/25.
//

import SwiftUI

struct HomeCardsView: View {
    let recipe: Recipe
    @EnvironmentObject var favoriteManager: FavoritesManager
    var body: some View {
        VStack(alignment: .leading){
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 110)
                .clipped()
                .cornerRadius(15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.custom("Baloo2-Regular", size: 12))
                        .foregroundColor(Color("TextColor"))
                    
                    Text("\(recipe.time.value) \(recipe.time.unit.rawValue)")
                        .font(.custom("Baloo2-Regular", size: 12))
                        .foregroundColor(Color("Detail"))
                }
                
                Spacer()
                
                Button(action: {
                    favoriteManager.toggleFavorite(recipe)
                }) {
                    Image(systemName: favoriteManager.isFavorite(recipe) ? "heart.fill" : "heart")
                        .foregroundStyle(favoriteManager.isFavorite(recipe) ? Color("AccentColor") : Color("AccentColor"))
                        .font(.custom("Baloo2-Regular", size: 16))
                }
            }
        }
        .frame(width: 130, height: 170)
        .padding(.horizontal)
        .padding(.top)
        .background(Color.clear)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("SecondColor").opacity(1), lineWidth: 2))
        //        .background(
        //            RoundedRectangle(cornerRadius: 12)
        //                .fill(Color.white)
        //                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        //        )
    }
}

#Preview {
    HomeCardsView(
        recipe: Recipe(
            id: UUID(),
            name: "Strogonoff",
            category: .lunch,
            image: "strogonoff",
            ingredients: [],
            time: Time(value: 10, unit: .minutes),
            description: "Delicioso sanduíche natural de frango.",
            steps: [],
            isFavorite: true
        )
    )        .environmentObject(FavoritesManager())

}
