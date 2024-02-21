//
//  RecipeView.swift
//  RecipeJSONSwiftUI
//
//  Created by Cause  I'm Electric on 2/21/24.
//

import SwiftUI

struct RecipeView: View {
    @State private var recipeName: String = ""
    let recipeClient = RecipeClient()
    @State private var recipes: [Recipe] = []
    var body: some View {
        VStack {
            TextField("enter name", text: $recipeName)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    Task {
                        do {
                            recipes = try await recipeClient.searchRecipe(recipeName)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }.padding()
            List(recipes) { recipe in
                HStack {
                    AsyncImage(url: recipe.featuredImage) { image in
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0,
                                                        style: .continuous))
                            .frame(width: 100, 
                                   height: 100)
                    } placeholder: {
                        ProgressView("Hold on...")
                    }
                    Text(recipe.title)
                }
            }
        }
    }
}

#Preview {
    RecipeView()
}
