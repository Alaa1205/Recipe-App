// Dev Alaa Alhamzi


import SwiftUI

struct Home: View {
    
    @StateObject var recipeVM : RecipeViewModel
   
    var body: some View {
        
    
            NavigationStack{
                
                
                VStack {
                    
                        Image(systemName: "fork.knife.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 325.0, height: 327.0, alignment: .center)
                            .foregroundColor(Color("Orange"))
                            .padding()
                        
                        Text("There's no recipe yet")
                            .font(.system(size: 34, weight: .bold))
                            .frame(width: 330.0, height: 40.0)
                            .padding()
                           // .padding(.top, 24)
                        
                        Text("Please add your recipes")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(Color("LightGray"))
                            .frame(width: 238, height: 26, alignment: .center)
                            .padding()
                        
                    
         
                    
  
        

                    
                }
                .navigationTitle("Food Recipes")
                
               
                
                
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
    Home(recipeVM : RecipeViewModel())
}


/*import SwiftUI

struct Home: View {
    @ObservedObject var recipeVM: RecipeViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if recipeVM.recipesArray.isEmpty {
                    Image(systemName: "fork.knife.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 325.0, height: 327.0)
                        .foregroundColor(Color("Orange"))
                    
                    Text("There's no recipe yet")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.top, 24)
                    
                    Text("Please add your recipes")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundColor(Color("LightGray"))
                        .padding(.top, 24)
                    
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(recipeVM.recipesArray) { recipe in
                                ZStack {
                                    if let image = recipe.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 414, height: 272)
                                    }

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(recipe.title)
                                            .font(.system(size: 35, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        
                                        HStack(spacing: -40) {
                                            Text(recipe.description)
                                                .font(.system(size: 25, weight: .medium))
                                                .foregroundColor(.white)
                                                .padding(.horizontal)

                                            NavigationLink(destination: Recipe_Edit_Page(recipe: recipe)) {
                                                Text("See All")
                                                    .font(.system(size: 12, weight: .bold))
                                                    .foregroundColor(Color("Orange"))
                                            }
                                        }
                                    }
                                    .padding(.vertical, 50)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Food Recipes")
            .toolbar {
                NavigationLink(destination: New_Recipe(recipeVM: recipeVM)) {
                    Image(systemName: "plus")
                        .foregroundColor(Color("Orange"))
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home(recipeVM: RecipeViewModel())
}*/




