//
//  Photo Picker.swift
//  Recipe App
//
//  Created by Alaa Emad Alhamzi on 17/04/1446 AH.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage : UIImage?
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    
    //Create the Image picker
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
    
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
  

        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context){
        
        
        //leave
        
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent : ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
}

/*#Preview {
    Photo_Picker()
}*/
