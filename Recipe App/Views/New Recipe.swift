//
//  New Recipe.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 16/04/1446 AH.
//

import SwiftUI

struct New_Recipe: View {
    
    //Image related variables
    @State var changeRecipeImage  = false
    @State var openCameraRoll = false
    @State var imageSelected : UIImage? = nil
    
    //Text Field ralted variables
    @State private var title : String = ""
    @State private var description : String = ""
    
    //Plus of the ingredient
    @State private var showPopUp = false
    @State var IngredientName = ""
    @State var measurment = "Spoon"
    let maeasurments  = ["Spoon", "Cup"]
    //counter
    @State var counter: Int = 1
    
    @Environment(\.presentationMode) var presentaionMode
    @ObservedObject var recipeVM : RecipeViewModel
    @Binding var recipe : Recipe?
    @State var ingredients : [Ingredient] = []
    @State private var navigateToHome: Bool = false
    
    
    //init to display the recipe data in edit case
    init(recipeVM: RecipeViewModel , recipe : Binding<Recipe?> = .constant(nil)){
        
        self.recipeVM = recipeVM
        self._recipe = recipe
        
        //if there is a recipe receiver from the edit view
        if let unwrappedRecipe = recipe.wrappedValue {
                    _title = State(initialValue: unwrappedRecipe.title)
                    _description = State(initialValue: unwrappedRecipe.description)
                    _imageSelected = State(initialValue: unwrappedRecipe.image)
                    _ingredients = State(initialValue: unwrappedRecipe.ingredients)
                }
    }
    
    
    var body: some View {
        
        ZStack{

            NavigationStack{
                
                ScrollView{
                VStack (spacing: 10){
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 413, height: 181)
                            .foregroundColor(Color("Gray").opacity(0.8))
                        
                            .overlay(
                                Rectangle()
                                    .strokeBorder(Color("Orange"),
                                                  style:
                                                    StrokeStyle(
                                                        lineWidth: 1,
                                                        lineCap: .butt,
                                                        lineJoin: .miter,
                                                        dash: [7],
                                                        dashPhase: 10
                                                        
                                                        
                                                    ))
                            )
                        
                        
                        VStack {
                            
                            Button(action:{
                                
                                //changeRecipeImage = true
                                openCameraRoll = true
                                
                            }, label:{
                                
                                
                                if let selectedImage = imageSelected{
                                    
                                    Image(uiImage: selectedImage)
                                        .resizable().scaledToFill()
                                        .frame(width: 413, height: 181)
                                        .cornerRadius(5)
                                        .overlay(
                                            Rectangle()
                                                .strokeBorder(Color("Orange"),
                                                              style:
                                                                StrokeStyle(
                                                                    lineWidth: 1,
                                                                    lineCap: .butt,
                                                                    lineJoin: .miter,
                                                                    dash: [7],
                                                                    dashPhase: 10
                                                                )
                                                             )
                                        )
                                    
                                }
                                else{
                                    
                                    VStack{
                                        Image(systemName: "photo.badge.plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 85,height: 71)
                                            .foregroundColor(Color("Orange"))
                                        
                                        Text("Upload Photo")
                                            .font(.system(size: 22, weight: .bold))
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                                
                                
                                
                            })
                            
                            
                        }
                        
                        .sheet(isPresented: $openCameraRoll){
                            ImagePicker(selectedImage : $imageSelected ,sourceType : .photoLibrary)
                            
                        }
                        
                        
                    }//.position(x: 200,y: 150)
                    .padding()
                    // .padding(.vertical, -10)
                    
                    
                    
                    Text("Title")
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    // .padding()
                    //.padding(.vertical, -410)
                        .padding(.horizontal, 40)
                    
                    
                    
                    TextField("  Title", text: $title)
                        .frame(width: 366, height: 47)
                        .background(Color("Gray").opacity(0.8))
                        .cornerRadius(8)
                    // .padding()
                    // .padding(.vertical, -380)
                    
                    
                    
                    
                    
                    
                    Text("Description")
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    // .padding()
                    //.padding(.vertical, -310)
                        .padding(.horizontal, 40)
                    
                    TextField("  Descripotion", text: $description)
                        .padding(.horizontal)
                        .frame(width: 367, height: 130, alignment: .topLeading)
                    
                        .padding(.top)
                        .background(Color("Gray").opacity(0.8))
                        .cornerRadius(8)
                    // .padding()
                    //.padding(.vertical, -280)
                    
                    
                    HStack{
                        
                        Text("Add Ingredients")
                            .font(.system(size: 24, weight: .bold))
                        //.frame(width: 200, height: 29, alignment: .topLeading)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        //.padding()
                            .padding(.horizontal, 40)
                        
                        
                        Spacer()
                        
                        
                        Button(action: {
                            
                            showPopUp = true
                            
                            
                            
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 26)
                                .foregroundColor(Color("Orange"))
                                .fontWeight(.bold)
                            // .padding()
                                .padding(.horizontal, 40)
                            
                        })
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }//.padding(.vertical, -110)
                    ScrollView{
                        
                        ForEach(ingredients){ingredient in
                            
                            HStack{
                                
                                Text("\(ingredient.quantity)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("Orange"))
                                    .padding(.horizontal)
                                
                                Text(ingredient.ingredientName)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("Orange"))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text(ingredient.mesurment == "Spoon" ? "🥄Spoon" : "🥛Cup")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 29)
                                    .background(Color("Light Orange"))
                                    .border(Color("Orange"))
                                    .cornerRadius(4)
                                
                                    .padding(.trailing)
                            }
                            .frame(width: 358, height: 52)
                            .background(Color("Gray").opacity(0.8))
                            .cornerRadius(8)
                            
                            
                        }
                    }
                    
                    .navigationTitle("New Recipe")
                    .toolbar{
                        
                        ToolbarItem(){
                            
                            
                            
                            Button(action:{
                                
                                if var unwrappedRecipe = recipe {
                                    // Update the existing recipe directly
                                    unwrappedRecipe.title = title
                                    unwrappedRecipe.description = description
                                    unwrappedRecipe.image = imageSelected
                                    unwrappedRecipe.ingredients = ingredients
                                    
                                    recipeVM.updateRecipe(unwrappedRecipe)
                                    
                                    NavigationLink(destination: Recipes_List(recipeVM: recipeVM), isActive: $navigateToHome) {
                                       
                                    }
                                }
                                else{
                                    
                                    recipeVM.addRecipe(title: title , description: description, image: imageSelected, ingredients : ingredients)
                                    
                                    NavigationLink(destination: Recipes_List(recipeVM: recipeVM), isActive: $navigateToHome) {
                                       
                                    }
                                }
                                
                                navigateToHome = true
                                
                     
                                
                                
                            },label:{
                                
                                Text("Save")
                                    .foregroundColor(Color("Orange"))
                            })
                            
                            NavigationLink(destination: Recipes_List(recipeVM: recipeVM), isActive: $navigateToHome) {
                               
                            }
                            
                        }
                        
                        ToolbarItem(placement: .topBarLeading){
                            
                            NavigationLink(destination: Home(recipeVM: recipeVM)){
                                
                                
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color("Orange"))
                                Text("back")
                                    .foregroundColor(Color("Orange"))
                                
                                
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                    }.toolbarBackgroundVisibility(.visible, for: .navigationBar)
                    
                }
            }
                

                .navigationBarBackButtonHidden(true)
                
         
            
            
           
            }
            
            if showPopUp {
                
                // Dark background
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                // Centered pop-up with rounded corners
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 300, height: 200)
                    .shadow(radius: 10)
                    
                VStack (spacing: 20){
                    
                    Text("Ingredient Name")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.horizontal)
                   
                    
                    
                    TextField("Ingredient Name", text: $IngredientName)
                        .padding(.horizontal)
                        .frame(width: 275, height: 39)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                      
                    
                    Text("Measurment")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.horizontal)
                     
                    
                    HStack (spacing: 12){
                        
                        ForEach(maeasurments , id: \.self){ measur in
                           
                            Button {
                                measurment = measur
                            } label: {
                                
                                Text(measur == "Spoon" ? "🥄Spoon" : "🥛Cup")
                                    .frame(width: 104, height: 40)
                                    
                                    .background( Color("Orange") )
                                    .foregroundColor( Color.white )
                                    .cornerRadius(8)
                            }

                        }
                            
                     
                        
                    }//Measure buttons settings
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal)
                    
                    
                    
                  
                        Text("Serving")
                    
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal)
                   
                            
                    
                        //left side buttons
                        
                    
                    ZStack{
                        
                        
                        
                        Rectangle().frame(width: 260, height: 45)
                            .cornerRadius(4)
                            .foregroundColor(Color(UIColor.systemGray5))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                          
                        
                        
                        
                        
                            Rectangle().frame(width: 145, height: 45)
                                .cornerRadius(4)
                                .foregroundColor(Color("Orange"))
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                             
                                
                            
                           
                            
                        
                        
                        
                        HStack (spacing: 3){
                            
                            Button {
                                
                                if counter > 0{
                                    counter -= 1
                                }
                                
                            } label: {
                                
                                Image(systemName:"minus")
                                   // .padding()
                                    .frame(width: 27, height: 25)
                                    .background(Color(UIColor.systemGray5))
                                    .foregroundColor(Color("Orange"))
                                    .cornerRadius(4)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color("Orange"), lineWidth: 0.5)
                                    )
                                
                                
                            }.padding(.horizontal)
                            
                            
                            Text("\(counter)")
                                .font(.system(size: 20, weight: .regular))
                               // .padding(.horizontal)
                            
                            Button {
                                counter += 1
                            } label: {
                                Image(systemName: "plus")
                                  //  .padding()
                                    .frame(width: 27, height: 25)
                                    .background(Color(UIColor.systemGray5))
                                    .foregroundColor(Color("Orange"))
                                    .cornerRadius(4)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color("Orange"), lineWidth: 0.5)
                                    )
                            }.padding(.horizontal)
                            
                            
                            
                            
                            Text(measurment == "Spoon" ? "🥄Spoon" : "🥛Cup")
                               
                                .frame(width: 100, height: 24)
                                .padding(.horizontal, 2)
                                //.padding(.leading, 110)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20 , weight: .regular))
                               
                            
                            
                            
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                           
                         
                        
                        
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.horizontal)
                    
                    
    
                    
                    HStack(spacing: 10){
                         
                         Button {
                             showPopUp = false
                         } label: {
                             Text("Cancel")
                                 .font(.system(size: 20 , weight: .regular))
                                 .frame (width: 134, height: 40)
                                 .background(Color(UIColor.systemGray5))
                                 .cornerRadius(4)
                                 .foregroundColor(.red)
                         }

                         
                         Button {
                             
                             let newIngredient = Ingredient(ingredientName: IngredientName, mesurment: measurment, quantity: counter)
                             
                             ingredients.append(newIngredient)
                             
                             IngredientName = "" // Clear input after adding
                                 counter = 1
                                 measurment = "Spoon"
                                 showPopUp = false
                             
                           
                         } label: {
                             Text("Add")
                                 .font(.system(size: 20 , weight: .regular))
                                 .frame (width: 134, height: 40)
                                 .background(Color("Orange"))
                                 .cornerRadius(4)
                                 .foregroundColor(.white)
                         }
                         
                    }                 
                    

                   
                        
                    
                
                }
                 .frame(width: 306, height: 400)
               
                
                
                    .background(Color.white)
                    
                    .cornerRadius(8)
                    
                    .transition(.scale)  // Animates the modal appearing
                   .animation(.easeInOut, value: showPopUp)
                
                
            }

            
            
            
        }
        
    }
    }


#Preview {
    // Sample ingredients array
    let sampleIngredients = [
        Ingredient(ingredientName: "Ingredient 1", mesurment: "Spoon", quantity: 1)
    ]
    
    // Declare sampleRecipe as an optional using @State
    @State var sampleRecipe: Recipe? = Recipe(
        title: "Sample Recipe",
        description: "A delicious recipe",
        image: nil,
        ingredients: sampleIngredients
    )
    
    // Pass a binding to the optional sampleRecipe
    New_Recipe(recipeVM: RecipeViewModel(), recipe: $sampleRecipe)
}

