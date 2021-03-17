//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: -PROPERTIES
   var animalModel: AnimalModel
    //MARK: -BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animalModel.image)
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(
                RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 0 ){
                Text(animalModel.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    
               
                
                Text(animalModel.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
                
            }//:VStack
        }//:HStack
    }
}
//MARK: - PREVIEWS
struct AnimalListItemView_Previews: PreviewProvider {
    static let arrayAnimais: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animalModel: arrayAnimais[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
