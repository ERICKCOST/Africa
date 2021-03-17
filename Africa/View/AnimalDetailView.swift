//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Erick on 07/03/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: -PROPERTIES
    let animalModel: AnimalModel
    
    //MARK - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                //HERO IMAGE  -- 
                Image(animalModel.image)
                    .resizable()
                    .scaledToFit()
                
                //TITLE
                Text(animalModel.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y: 24))
                
                //HEADLINE
                Text(animalModel.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animalModel: animalModel)
                }
                .padding(.horizontal)
                
                //FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactsView(animalModel: animalModel)
                }
                
                .padding(.horizontal)
                
                //DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animalModel.name)")
                    Text(animalModel.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        .padding()
                }
                
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsertMapView()
                
                }
              
                //LINK
                
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                }
                
                
            }//: VStack
            .navigationBarTitle("Learn about \(animalModel.name)",
                                displayMode: .inline)
            ExternalWeblinkView(animalModel: animalModel)
                .padding()
            
            
            
        }//: SCROLL
    }
}


//MARK: - PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
    static let animais: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animalModel: animais[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
