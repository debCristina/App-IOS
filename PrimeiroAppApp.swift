//
//  PrimeiroAppApp.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 18/05/25.
//

import SwiftUI
import SwiftData

@main
struct PrimeiroApp: App {
    @StateObject var shoppingViewModel = ShoppingListViewModel()
    @StateObject var favoritesManager = FavoritesManager()
    @StateObject var recipesViewModel = RecipesViewModel()
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor.clear
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        let solidAppearance = UINavigationBarAppearance()
        solidAppearance.configureWithDefaultBackground()
        solidAppearance.titleTextAttributes = [
            .font: UIFont(name: "Baloo2-Bold", size: 22)!,
            .foregroundColor: UIColor.label
        ]
        solidAppearance.largeTitleTextAttributes = [
            .font: UIFont(name: "Baloo2-Bold", size: 30)!,
            .foregroundColor: UIColor.label
        ]
        
        let transparentAppearance = UINavigationBarAppearance()
        transparentAppearance.configureWithTransparentBackground()
        transparentAppearance.titleTextAttributes = solidAppearance.titleTextAttributes
        transparentAppearance.largeTitleTextAttributes = solidAppearance.largeTitleTextAttributes
        
        UINavigationBar.appearance().standardAppearance = solidAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = transparentAppearance
        UINavigationBar.appearance().compactAppearance = solidAppearance
        UINavigationBar.appearance().tintColor = .black
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .accent
        UISegmentedControl.appearance().setTitleTextAttributes([
            .font: UIFont(name:"Baloo2-SemiBold", size: 16)!,
            .foregroundColor: UIColor.black], for: .selected)
        
        UISegmentedControl.appearance().setTitleTextAttributes([
            .font: UIFont(name:"Baloo2-Regular", size: 16)!,
            .foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some Scene {

        WindowGroup {
            ContentView()
                .environmentObject(shoppingViewModel)
                .environmentObject(favoritesManager)
                .environmentObject(recipesViewModel)

        }
    }
}
