//
//  ContentView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: -PROPERTIES
    let arrayAnimais: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    
   // let gridLayout :[GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible() )]
    @State private var gridColumn :Int = 1
    @State private var toobarIcon: String = "square.grid.2x2"
    
    //MARK: FUNCTIONS
    func gridSwitch()  {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number\(gridColumn)")
        
        //Toolbar Image
        switch gridColumn{
            case 1:
            toobarIcon = "square.grid.2x2"
        case 2:
            toobarIcon = "square.grid.3x2"
        case 3:
            toobarIcon = "rectangle.grid.1x2"
        default:
            toobarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: -BODY
    
    var body: some View {
        

        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(arrayAnimais){animalModel in
                            NavigationLink (destination: AnimalDetailView(animalModel: animalModel )){
                                AnimalListItemView(animalModel: animalModel)
                            }//:LINK
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//:List
                } else {
                    ScrollView(.vertical, showsIndicators : false){
                        LazyVGrid(columns: gridLayout, alignment:.center , spacing: 10   ){
                            ForEach(arrayAnimais) { item in
                                NavigationLink (destination: AnimalDetailView(animalModel: item )){
                                    AnimalGridView(animalModel: item)
                                }//:LINK
                            }//:LOOP
                            
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn)
                    }//:ScrollView
                }//: COdition
                
            }//:Group
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing:16){
                        //LIST
                        Button(action:{
                            print("list view esta ativado")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            print("Grid view esta ativado")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                           Image(systemName: toobarIcon)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary )
                        })
                    }//: HSTACK
                }//:buttons
                    
            }//: Toobar
        }//:navigation
        
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
