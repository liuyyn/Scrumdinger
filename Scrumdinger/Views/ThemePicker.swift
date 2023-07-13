//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-11.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) // you can tag subviews when you need to differentiate among them in controls like pickers and lists. tag values can be any hashable type like in an enumeration
            }
        }
        .pickerStyle(.navigationLink) // when a user interacts with a navigation style picker, the system pushes the picker view onto the navigation stack. the picker view displays each theme in a ThemeView that highlights the theme's color
    }
}

struct ThemePicker_Previews : PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle)) // pass a constant binding to initialize a theme picker in the preview - you can use the contant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app's user interface
    }
}
