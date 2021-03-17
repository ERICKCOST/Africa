//
//  CenterModifier.swift
//  Africa
//
//  Created by Erick on 16/03/21.
//

import SwiftUI


struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
