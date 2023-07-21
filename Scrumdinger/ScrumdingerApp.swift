//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-06-20.
//

import SwiftUI

@main // by preceding the definition with @main, you inform the system that this is the only entry point to your app
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper? // default value of an optional is nil
    
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later ")
                    }
                }
            }
                .task { // the task modifier allows asynchronous function calls
                    do {
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                    }
                        
                }
                .sheet(item: $errorWrapper) {
                    store.scrums = DailyScrum.sampleData
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
}
