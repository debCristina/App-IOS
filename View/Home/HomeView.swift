//
//  RecipesView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 18/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
            ScrollView {
                HomeCategoriesView()
            }
            .listStyle(.plain)
            .navigationTitle("Receitas")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    Button {
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.searchable(text: $searchText, prompt: "Buscar receitas")
        }
}

#Preview {
    HomeView()
}
