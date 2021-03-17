//
//  MapView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [LocalizacaoModel] = Bundle.main.decode("locations.json")
    
    //MARK: BODY
    var body: some View {
        //MARK: No 1 Basic Map
        //Map(coordinateRegion: $region)
        
        //MARK: No2 MAP com Anataçoes
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:{
            item in
            // Opção {A} PIN: old Style (always static)
           // MapPin(coordinate: item.localizacao, tint: .accentColor)
            
            //Opção {B} MARKER: NEW Style (Always Static)
            //MapMarker(coordinate: item.localizacao, tint: .accentColor)
            
            //Opção {C} Custom Basic Annotation (it could be Interactive)
//            MapAnnotation(coordinate: item.localizacao) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            //Opção {D} Custom Advanced Annotation (it could be Interactive)
            MapAnnotation(coordinate:  item.localizacao){
                MapAnnotationView(localizacaoModel: item)
            }
            
        })//:MAP
        .overlay(
            HStack (alignment: .center, spacing: 12)
            {
                Image("compass")
                .resizable()
                .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
             
             
                    
                    Divider()
                    
                }//:VStack
            }//:HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                            .cornerRadius(8)
                            .opacity(0.6
                            )
            )
            .padding()
            ,alignment : .top
        )
        
        
    }
}


//MARK: PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
