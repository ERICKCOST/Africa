//
//  VideoListItem.swift
//  Africa
//
//  Created by Erick on 10/03/21.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let videoModel: VideoModel
    
    //MARK: - BODY
    var body: some View {
        HStack (spacing: 10){
            ZStack {
                Image(videoModel.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 32)
                    .shadow(radius: 4 )
            }//: ZStack
            VStack(alignment: .leading, spacing: 10, content: {
                Text(videoModel.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(videoModel.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            })
        }//: HStack
    }
}

//MARK: - PREVIEW
struct VideoListItem_Previews: PreviewProvider {
    static let videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(videoModel: videos[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
