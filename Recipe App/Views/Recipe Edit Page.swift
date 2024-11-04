//
//  Recipe Edit Page.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 23/04/1446 AH.
//

import SwiftUI

struct Recipe_Edit_Page : View{
    
    @State var recipe : Recipe
    @ObservedObject var recipeVM : RecipeViewModel
    @State  var showAlert = false
    @Environment(\.presentationMode) var presentationMode
 
    var body: some View {
        
       
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 10){
                
                if let image = recipe.image{
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 418, height: 272)
                        .padding()
                        .padding(.horizontal, 20)
                    
                }
                else{
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 414, height: 272)
                        .overlay(
                            Text("No Image Available")
                                .foregroundColor(.white)
                        )
                        .padding()
                        .padding(.horizontal,20)
                }
                
                Text(recipe.description)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color("DescrGray"))
                  //  .padding()
                    .padding(.horizontal, 60)
                    
                
                
                
                
                
                if !recipe.ingredients.isEmpty{
                    
                    Text("Ingredients")
                        .font(.system(size: 24, weight: .bold))
                        //.padding()
                        .padding(.horizontal, 60)
                        //.padding(.leading)
                        .frame(maxWidth:.infinity, alignment: .leading)
                    
                    ScrollView{
                        
                        ForEach(recipe.ingredients){ ingredient in
                            
                            HStack{
                                
                                Text("\(ingredient.quantity)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("Orange"))
                                    .padding(.horizontal)
                                
                                Text(ingredient.ingredientName)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("Orange"))
                                
                                Spacer()
                                
                                Text(ingredient.mesurment == "Spoon" ? "🥄Spoon" : "🥛Cup")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 29)
                                    .background(Color("Light Orange"))
                                    .border(Color("Orange"))
                                    .cornerRadius(4)
                                
                                    .padding(.trailing)
                                
                            }.frame(width: 358, height: 52)
                                .background(Color("Gray").opacity(0.8))
                                .cornerRadius(8)
                                .padding(.horizontal, 40)
                               // .padding()
                            
                            
                        }
                    }.padding(.horizontal, 30)
                }
                
                Spacer()
                
                Button {
                    showAlert = true
                } label: {
                    Text("Delete Recipe")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color("Red"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(width: 370, height: 52)
                        .background(Color("Gray").opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal, 60)
                    
                }.alert(isPresented: $showAlert){
                  
                  Alert(
                      title: Text("Delete a recipe").font(.system(size: 17, weight: .semibold)),
                      message: Text("Are you sure you want to delete the recipe?").font(.system(size: 13, weight: .regular)),
                      primaryButton: .destructive(Text("Yes").font(.system(size: 17, weight: .semibold)).foregroundColor(Color("Orange"))){
                          recipeVM.deleteRecipe(recipe)
                          presentationMode.wrappedValue.dismiss()
                      },
                      secondaryButton: .cancel()
                                                          
                      )
                 
              }
              
                
                .navigationTitle(recipe.title)
                            .font(.system(size: 34, weight: .bold))
                            
                            .toolbar{
                           
                                ToolbarItem(placement: .topBarTrailing){
                                    
                                    NavigationLink(destination: New_Recipe(recipeVM: recipeVM, recipe: Binding<Recipe?>(get: { recipe }, set: { _ in })) ){
                                        
                                        Text("Edit")
                                            .font(.system(size: 17, weight: .medium))
                                            .foregroundColor(Color("Orange"))
                                        
                                    }
                                    
                                }
                                
                                
                                ToolbarItem(placement: .topBarLeading){
                                    
                                    Button {
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Image(systemName: "chevron.backward")
                                            .foregroundColor(Color("Orange"))
                                        
                                        Text("Back")
                                            .font(.system(size: 17, weight: .medium))
                                            .foregroundColor(Color("Orange"))
                                        
                                    }
                                    
                                    
                                        
                                    
                                }

                                }.toolbarBackgroundVisibility(.visible, for: .navigationBar)

                
                
                
                
                
                
            }.navigationBarBackButtonHidden(true)
            
            
            

                
            }
            
            
        }
            
        }

#Preview {
    // Assuming Ingredient has an initializer that takes a name (or similar property)
    let sampleIngredients = [
        Ingredient(ingredientName: "Ingredient 1", mesurment : "Spoon", quantity: 1)
       
    ]
    
    let sampleRecipe = Recipe(
        title: "Sample Recipe",
        description: "A delicious recipe",
        image: nil,
        ingredients: sampleIngredients // Passes an array of Ingredient objects
    )
    
    Recipe_Edit_Page(recipe: sampleRecipe, recipeVM: RecipeViewModel())
}
/*import SwiftUI

struct Recipe_Edit_Page: View {
    
    
    let recipe : Recipe
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading, spacing: 10){
                
                if let image = recipe.image{
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 414,height: 272)
                }
                
                else{
                    
                    Rectangle()
                                            .fill(Color.gray)
                                            .frame(width: 414, height: 272)
                                            .overlay(
                                                Text("No Image Available")
                                                    .foregroundColor(.white)
                                            )
                }
                
                Text(recipe.description)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal)
                
                
            }
            
            .padding()
            navigationTitle(recipe.title)
            
        }
    }
}*/




/*import SwiftUI

struct Recipe_Edit_Page: View {
    let recipe: Recipe  // Accepts the recipe passed from the Home view

    var body: some View {
        
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 16) {
                // Display the recipe image if available
                if let image = recipe.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 414, height: 272)
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 414, height: 272)
                        .overlay(
                            Text("No Image Available")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                }
         
                
                // Display the recipe description
                Text(recipe.description)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Spacer()
            }.padding()
            
            
            .navigationTitle(recipe.title)
            .font(.system(size: 34, weight: .bold))
            .toolbar{
                
               
                ToolbarItem(placement: .topBarTrailing){
                    
                    Button {
                        //
                    } label: {
                        Text("Edit")
                            .font(.system(size: 17, weight: .regular))
                    }

                }
            }.toolbarBackgroundVisibility(.visible, for: .navigationBar)
            
                .navigationBarBackButtonHidden(true)
        }
    }
}*/



