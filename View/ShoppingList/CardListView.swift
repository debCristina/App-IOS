//
//  CardListView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 24/05/25.
//

import SwiftUI

struct CardListView: View {
    let title: String
    let itemCount: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "list.bullet.rectangle.portrait")
                .bold()
                .frame(width: 48, height: 48)
                .font(.custom("Baloo2-Bold", size: 24))
                .background(Color.accent)
                .foregroundStyle(.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: -6) {
                Text(title)
                    .font(.custom("Baloo2-SemiBold", size: 20))
                    .foregroundStyle(Color("TextColor"))
                Text("\(itemCount) itens")
                    .font(.custom("Baloo2-Regular", size: 16))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "pencil")
                .foregroundColor(.orange)
        }
        .padding()
        
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.1), lineWidth: 2))
//        .background(
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(Color.white)
//                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
//                    )
    }
}

#Preview {
    CardListView(title: "Mercado", itemCount: 15)
}
