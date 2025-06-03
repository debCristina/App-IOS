//
//  Time.swift
//  PrimeiroApp
//
//  Created by Débora Cristina Silva Ferreira on 26/05/25.
//

import Foundation

struct Time: Equatable, Hashable{
    let value: Int
    let unit: TimeUnit
}

enum TimeUnit: String{
    case minutes = "minutos"
    case hours = "horas"
}


