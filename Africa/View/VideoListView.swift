//
//  VideoListView.swift
//  Africa
//
//  Created by Erick on 06/03/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK: -Properties
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            List{
                ForEach(videos) { item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(videoModel: item)
                            .padding(.vertical, 8)
                    }
                        
                }//loop
            }//:list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode:.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        //Carregar novos Videos
                       // videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                       Image(systemName: "arrow.2.squarepath")
                    }
                }
            })
        }//:Navigation
    }
}


//MARK: PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
