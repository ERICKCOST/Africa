//
//  VideoModel.swift
//  Africa
//
//  Created by Erick on 10/03/21.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    
    // Computed Property
    var thumbnail: String {
      "video-\(id)"
    }
}
