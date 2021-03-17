//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Erick on 08/03/21.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTIES
    
    let animalModel : AnimalModel
    //MARK - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animalModel.name, destination: ((URL(string: animalModel.link)
                                                            ?? URL(string: "https://wikipedia.org"))!))
                }
                .foregroundColor(.accentColor)
            }//:HStack
        }//:Box
    }
}

//MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static var animais : [AnimalModel] = Bundle.main.decode("animal.json")
    
    static var previews: some View {
        ExternalWeblinkView(animalModel: animais[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
