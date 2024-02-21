//
//  Recipe.swift
//  RecipeJSONSwiftUI
//
//  Created by Cause  I'm Electric on 2/21/24.
//

import Foundation

struct RecipeResponse: Decodable {
    let results: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    let id: Int
    let title: String
    let featuredImage: URL
    
    private enum CodingKeys: String, CodingKey {
        case title
        case featuredImage = "featured_image"
        case id = "pk"
    }
}
