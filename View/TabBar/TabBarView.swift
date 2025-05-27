//
//  TabBarView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 18/05/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Receitas", systemImage: "book.pages.fill")
            }
            
            NavigationStack {
                ShoppingListView()
            }
            .tabItem {
                Label("Compras", systemImage: "list.bullet.rectangle.portrait")
            }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    TabBarView()
}
