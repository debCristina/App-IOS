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
    init() {
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
        }
    }
}
