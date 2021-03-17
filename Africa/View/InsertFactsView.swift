//
//  InsertFactsView.swift
//  Africa
//
//  Created by Erick on 07/03/21.
//

import SwiftUI

struct InsertFactsView: View {
    //MARK: -PROPERTIES
    let animalModel : AnimalModel
    
    
    //MARK: -BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animalModel.fact, id: \.self) { item in
                    Text(item)
                }
                
            }//:tabs
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        }//:Box
    }
}

//MARK: - BODY
struct InsertFactsView_Previews: PreviewProvider {
    static let animais : [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertFactsView(animalModel: animais[1])
            .padding(.horizontal)
            .previewLayout(.sizeThatFits)
    }
}
