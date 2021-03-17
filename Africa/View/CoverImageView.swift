//
//  CoverImageView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - properties
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView{
            
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//:ForEach
        }//:Tab
        .tabViewStyle(PageTabViewStyle())

    }
}


//MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
