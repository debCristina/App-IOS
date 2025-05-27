//
//  RecipeDetailTip.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 23/05/25.
//

import SwiftUI

struct RecipeDetailTip: View {
    let tips: [String] = [
        "Descongele o frango: Garanta que o frango esteja na temperatura adequada para preparo.",
        "Cozinhe e desfie o frango com antecedência: Você pode cozinhar com água, sal, alho e louro na panela de pressão por 15–20 minutos. Depois de frio, desfie.",
        "Separe e pique todos os ingredientes do recheio: Isso agiliza muito.",
        "Pré-aqueça o forno a 180 °C enquanto prepara a massa.",
        "Meça todos os ingredientes antes de começar a bater.",
        "Unte a forma com óleo ou manteiga e farinha antes de colocar a massa."
    ]
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "lightbulb.max")
                    .foregroundStyle(Color.second)
                    .font(.custom("Baloo2-Bold", size: 14))
                Text("Dicas")
                    .font(.custom("Baloo2-SemiBold", size: 22))
                
                
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: 8) {
                        Text("•")
                            .font(.body)
                        Text(tip)
                            .font(.custom("Baloo2-Regular", size: 18))
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()

        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

#Preview {
    RecipeDetailTip()
}
