//
//  localizacaoModel.swift
//  Africa
//
//  Created by Erick on 13/03/21.
//

import Foundation
import MapKit

struct LocalizacaoModel: Codable, Identifiable{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    
    //Computed property
    var localizacao: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
