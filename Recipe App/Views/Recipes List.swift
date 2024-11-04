//
//  Recipes List.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 27/04/1446 AH.
//

import SwiftUI

struct Recipes_List: View {
    
   @StateObject var recipeVM : RecipeViewModel
   @State var searchText = ""
   var filterRecipes : [Recipe]{
        return recipeVM.recipesArray.filter{$0.title.localizedCaseInsensitiveContains(searchText)}
    }
    
    
    var body: some View {
        
    
            NavigationStack{
                
                
                VStack{
                        
                        ScrollView{
                            VStack (spacing: 16){
                                
                                
                                
                                ForEach(recipeVM.recipesArray) { recipe in
                                   
                                    ZStack(alignment: .bottomLeading){
                                        if let image = recipe.image {
                                            Image(uiImage: image)
                                                .resizable()
                                          
                                                .frame(width: 414,height: 272)
                                            
                                        }
                                        
                                        LinearGradient(
                                            
                                            gradient: Gradient(colors: [Color.black.opacity(0.9), Color.clear]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        
                                        ).frame(height: 230)
                                        
                                        VStack(alignment: .leading, spacing: 2){
                                            Text(recipe.title)
                                                .font(.system(size: 30, weight: .bold))
                                                .foregroundColor(.white)
                                                //.frame(maxWidth: .infinity, alignment: .topLeading)
                                                .padding(.horizontal)
                                            
                                            
                                            HStack(alignment: .center, spacing: 0){
                                                Text(recipe.description)
                                                    .font(.system(size: 20, weight: .medium))
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal)
                                                    .lineLimit(1)
                                          
                                                
                                                //Spacer()
                                                NavigationLink(destination: Recipe_Edit_Page(recipe : recipe, recipeVM : recipeVM)){
                                                    
                                                    Text("See All")
                                                        .font(.system(size: 12, weight: .bold))
                                                        .foregroundColor(Color("MoreLighOrange"))
                                                    
                                                        
                                                }
                                                .padding(.horizontal)

                                               
                                             

                                                
                                                
                                            }
                                            
                                        }.padding(.bottom, 10)
                                        .padding(.vertical, 10)
                                    } .padding(.horizontal)
                                }
                                
                            }
                        }.padding()
                        
                    
        

                    
                }
                .navigationTitle("Food Recipes")
                
                .searchable(text: $searchText, prompt: "Search")
                
                
                .toolbar{
                    
                    NavigationLink(destination: New_Recipe(recipeVM: recipeVM) ){
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("Orange"))
                    }
                
                
                    
                }.toolbarBackground(.visible, for: .navigationBar)
                
            
            }
            
     
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Recipes_List(recipeVM : RecipeViewModel())
}
