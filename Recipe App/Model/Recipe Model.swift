//
//  Recipe Model.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 23/04/1446 AH.
//

import SwiftUI

struct Recipe : Identifiable, Equatable{
    let id = UUID()
    var title : String
    var description : String
    var image: UIImage?
    var ingredients : [Ingredient] = []
}



struct Ingredient : Identifiable, Equatable{
    let id = UUID()
    var ingredientName : String
    var mesurment : String
    var quantity: Int
    
}

