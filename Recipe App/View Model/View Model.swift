//
//  View Model.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 23/04/1446 AH.
//

import SwiftUI
import PhotosUI

class RecipeViewModel : ObservableObject {
    
    //Array of objetct
    @Published var recipesArray : [Recipe] = []
    @Environment(\.presentationMode) var presentationMode
    
    func addRecipe ( title : String , description : String, image : UIImage?, ingredients : [Ingredient]){
        
        // create new object of the recipe model and append it in the object array.
        let newRecipe = Recipe( title: title, description: description, image: image, ingredients : ingredients)
        recipesArray.append(newRecipe)
    }
    
    func deleteRecipe(_ recipe: Recipe){
        
        if let index = recipesArray.firstIndex(of: recipe){
            recipesArray.remove(at: index)
            
        }
    }
    
    func updateRecipe(_ updatedRecipe: Recipe){
    
        if let index = recipesArray.firstIndex(where: {$0.id == updatedRecipe.id}){
            
            recipesArray[index] = updatedRecipe
        }
        
    }
    
}


