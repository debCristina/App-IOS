//
//  FilterView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 30/05/25.
//

import SwiftUI

struct FilterView: View {
    @State private var refeicoesSelecionadas: Set<String> = []
    
    @EnvironmentObject var recipesViewModel: RecipesViewModel
    @State private var ingredientesIncluidos: Set<String> = []
    @State private var ingredientesExcluidos: Set<String> = []
    
    private var receitasFiltradas: [Recipe] {
        let todas = recipesViewModel.recipes
        
        let porCategoria = todas.filter { receita in
            refeicoesSelecionadas.isEmpty || refeicoesSelecionadas.contains(receita.category.rawValue)
        }
        
        let comIngredientes = porCategoria.filter { receita in
            ingredientesIncluidos.allSatisfy { ingrediente in
                receita.ingredients.contains { $0.ingredient.name == ingrediente }
            }
        }
        
        let semIngredientesExcluidos = comIngredientes.filter { receita in
            ingredientesExcluidos.allSatisfy { ingrediente in
                !receita.ingredients.contains { $0.ingredient.name == ingrediente }
            }
        }
        return semIngredientesExcluidos
    }
    
    private var quantidadeReceitasFiltradas: Int {
        receitasFiltradas.count
    }
    
    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                VStack(alignment: .leading, spacing: 30){
//                    Text("Tempo de preparo")
//                        .font(.custom("Baloo2-SemiBold", size: 18))
//                    
//                    SliderView()
//                        .frame(height:50)
//                }.padding(.top)
//                
//                Divider()
//                
//                VStack(alignment: .leading, spacing: 10){
//                    Text("Refeição")
//                        .font(.custom("Baloo2-SemiBold", size: 18))
//                    
//                    VStack{
//                        ForEach(CategoryType.allCases, id: \.self) { opcao in
//                            HStack {
//                                Image(systemName: refeicoesSelecionadas.contains(opcao) ? "checkmark.circle.fill" : "circle")
//                                    .foregroundColor(.orange)
//                                Text(opcao.rawValue)
//                                    .font(.custom("Baloo2-Regular", size: 16))
//                                    .foregroundColor(.primary)
//                                Spacer()
//                            }
//                            .padding(.horizontal, 5)
//                            .padding(.vertical, 1)
//                            .onTapGesture {
//                                if refeicoesSelecionadas.contains(opcao) {
//                                    refeicoesSelecionadas.remove(opcao)
//                                } else {
//                                    refeicoesSelecionadas.insert(opcao)
//                                }
//                            }
//                        }
//                    }
//                }
//                .padding(.top)
//                .padding(.bottom)
//                
//                Divider()
//                
//                VStack(alignment: .leading, spacing: 10) {
//                    HStack{
//                        Text("Inclui ingredientes")
//                            .font(.custom("Baloo2-SemiBold", size: 18))
//                        
//                        Spacer()
//                        
//                        Image(systemName: "chevron.right")
//                            .bold()
//                            .foregroundStyle(Color.accentColor)
//                    }
//                    VStack{
//                        ForEach(recipesViewModel.ingredients.map(\.name), id: \.self) { ingrediente in
//                            HStack {
//                                Image(systemName: ingredientesIncluidos.contains(ingrediente) ? "checkmark.circle.fill" : "circle")
//                                    .foregroundColor(.orange)
//                                Text(ingrediente)
//                                    .font(.custom("Baloo2-Regular", size: 16))
//                                    .foregroundColor(.primary)
//                                Spacer()
//                            }
//                            .padding(.horizontal, 5)
//                            .padding(.vertical, 1)
//                            .onTapGesture {
//                                if ingredientesIncluidos.contains(ingrediente) {
//                                    ingredientesIncluidos.remove(ingrediente)
//                                } else {
//                                    ingredientesIncluidos.insert(ingrediente)
//                                }
//                            }
//                        }
//                    } .padding(.horizontal, 5)
//                        .padding(.vertical, 1)
//                    
//                }.padding(.top)
//                
//                Divider()
//                
//                
//                Button(action: {
//                    let nomes = receitasFiltradas.map { $0.name }
//                    print("Receitas filtradas: \(nomes)")
//                }) {
//                    HStack {
//                        Spacer()
//                        Text("Filtrar (\(quantidadeReceitasFiltradas) receitas)")
//                            .font(.custom("Baloo2-SemiBold", size: 16))
//                            .foregroundColor(.white)
//                            .padding()
//                        Spacer()
//                    }
//                    .background(Color.orange)
//                    .cornerRadius(10)
//                    .padding(.top)
//                }
//                
//            }
//            .padding(.horizontal)
//        }
//        .navigationTitle("Filtro")
    }
}

#Preview {
    FilterView()
}
