//
//  ContentView.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 18/05/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        TabBarView()
    }
}

#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
}
