//
//  GalleryView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: -PROPERTIES
    
    @State private var animalSelecionado: String = "lion"
    
    let animalModel : [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //SIMPLE GRID DEFINITION
    //let gridLayout :[GridItem] = [GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    //EFFICIENT GRID DEFINITION
   // let gridLayout : [GridItem] = Array(repeating: GridItem(), count: 3)
    
    // GRID LAYOUT Dinamico
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(6-gridColumn))
    }
    
    //MARK:- BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
           
            
            VStack (alignment: .center, spacing: 30){
                
                //MARK: IMAGE
                Image(animalSelecionado)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    
                //MARK: SLIDER
             
                 Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                
                //MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animalModel) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                animalSelecionado = item.image
                                haptics.impactOccurred()
                            }
                        
                    }//:LOOP
                }//: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//:HStack
            .padding(.horizontal,10)
            .padding(.vertical, 50)
        }//:Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
