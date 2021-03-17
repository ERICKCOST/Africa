//
//  AnimalGridView.swift
//  Africa
//
//  Created by Erick on 13/03/21.
//

import SwiftUI

struct AnimalGridView: View {
    //MARK: - PROPERTIES
    let animalModel: AnimalModel
    
    //MARK: - BODY
    var body: some View {
        Image(animalModel.image)
            .resizable()
            .cornerRadius(12)
            .scaledToFit()
        
    }
}

//MARK: -PREVIEW
struct AnimalGridView_Previews: PreviewProvider {
    static var animais: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridView(animalModel: animais[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
