//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Erick on 13/03/21.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: -PROPERTIES
    var localizacaoModel: LocalizacaoModel
    @State private var animation: Double = 0.0
    
    //MARK: -BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1-animation)
            
            Image(localizacaoModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//:ZStack
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1.0
            }
        }
    }
}

//MARK: PREVIEW
struct MapAnnotationView_Previews: PreviewProvider {
    static var localizacaoes:[LocalizacaoModel]=Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(localizacaoModel: localizacaoes[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
