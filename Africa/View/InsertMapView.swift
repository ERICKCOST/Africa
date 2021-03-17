//
//  InsertMapView.swift
//  Africa
//
//  Created by Erick on 08/03/21.
//

import SwiftUI
import MapKit

struct InsertMapView: View {
    //MARK: -PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 62.0, longitudeDelta: 62.0))
    
    //MARK: -BODY
    var body: some View {
       Map(coordinateRegion: $region)
        .overlay(NavigationLink(
                    destination: MapView()){
            HStack{
                Image(systemName: "mappin.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
                
                Text("Locations")
                    .foregroundColor(.accentColor)
                    .bold()
            }//:HStack
            .padding(.vertical,10)
            .padding(.horizontal, 14)
            .background(Color.black
                            .opacity(0.4)
                            .cornerRadius(8))
                    }//:Navigations
        .padding(12)
        , alignment: .topTrailing
        )
        .frame(height: 256)
        .cornerRadius(12)
    }
}

//MARK: - PREVIEW
struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
