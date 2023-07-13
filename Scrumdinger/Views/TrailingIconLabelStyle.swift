//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-06-20.
//

import SwiftUI

struct TrailingIconLabelStyle : LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        // here we want the label style to have the title before the icon 
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

//Use this modifier to set a specific style for all labels within a view
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
