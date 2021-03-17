//
//  CreditsView.swift
//  Africa
//
//  Created by Erick on 14/03/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Costa Silva Tecnology
    All right reserved
    Better Apps ♡ To You
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//:Vstack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
