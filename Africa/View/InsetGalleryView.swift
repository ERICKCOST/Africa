//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Erick on 07/03/21.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK - PROPERTIES
    let animalModel : AnimalModel
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators:false){
        
            HStack (alignment: .center, spacing: 15 ){
            
                ForEach(animalModel.gallery, id:\.self) { item in
                    Image(item)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                        .cornerRadius(12)
                }
            
        
            }//:HStack
        }//:ScrollView
    }
}

//MARK: Preview
struct InsetGalleryView_Previews: PreviewProvider {
    static let animais : [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animalModel: animais[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
