//
//  RecipeDetailView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 21/05/25.
//

import SwiftUI

struct RecipeDetailView: View {
    @State private var selectedSection = 0
    @Environment(\.dismiss) private var dismiss
    @State private var showingSheet = false

    var recipe : Recipe
    
    var body: some View {
        ScrollView{
            VStack(){
                ZStack (alignment: .leading){
                    Color(.white).ignoresSafeArea(edges: .top)
                    ZStack {
                        RecipeDetailImage(recipe: recipe)
                        VStack{
                            HStack(alignment: .top){
                                Button(action:{
                                    dismiss()
                                }){
                                    Image(systemName: "chevron.left")
                                        .bold()
                                        .frame(width: 34, height: 34)
                                        .background(Color.accent)
                                        .foregroundStyle(.black)
                                        .clipShape(Circle())
                                }
                                
                                Spacer()
                                
                                Button(action:{
                                }){
                                    Image(systemName: "heart.fill")
                                        .bold()
                                        .frame(width: 34, height: 34)
                                        .background(Color.accent)
                                        .foregroundStyle(.white)
                                        .clipShape(Circle())
                                }
                                
                                Button(action:{
                                    showingSheet.toggle()

                                }){
                                    Image(systemName: "lightbulb.max")
                                        .bold()
                                        .frame(width: 34, height: 34)
                                        .background(Color.accent)
                                        .foregroundStyle(.black)
                                        .clipShape(Circle())
                                }.sheet(isPresented: $showingSheet) {
                                    RecipeDetailTip()
                                        .presentationDetents([.medium, .large])
                                }
                            }
                            .padding(.horizontal, 32)
                            .padding(.top, 59)
                            Spacer()
                        }
                    }
                }
                VStack(alignment: .leading){
                    RecipeDetailNameView(recipe: recipe)
                        .padding(.horizontal)
                    
                    RecipeSegmentedPicker(recipe: recipe)
                        .padding(.horizontal)
                }
            }
        }.ignoresSafeArea(edges: .top)
        
        
    }
}


