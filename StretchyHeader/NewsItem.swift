//
//  NewsItem.swift
//  StretchyHeader
//
//  Created by Fariha on 7/17/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

import UIKit

struct NewsItem {
    
    enum NewsCategory {
        case world
        case americas
        case europe
        case middleEast
        case africa
        case asiaPacific
        
        func toString() -> String {
            switch self {
            case .world:
                return "World"
            case .americas:
                return "Americas"
            case .europe:
                return "Europe"
            case .middleEast:
                return "Middle East"
            case .africa:
                return "Africa"
            case .asiaPacific:
                return "Asia Pacific"
            }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .world:
                return .red
            case .americas:
                return .blue
            case .europe:
                return .green
            case .middleEast:
                return .yellow
            case .africa:
                return .orange
            case .asiaPacific:
                return .purple
            }
        }
        
    }
    
    let category: NewsCategory
    let headline: String
}
