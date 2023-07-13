//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-06-20.
//

import SwiftUI

@main // by preceding the definition with @main, you inform the system that this is the only entry point to your app
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $scrums)
        }
    }
}
