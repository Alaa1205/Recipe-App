//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 16/04/1446 AH.
//

import SwiftUI


@main
struct Recipe_AppApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            Home(recipeVM: RecipeViewModel())
        }
    }
}
