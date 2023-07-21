//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-14.
//

import SwiftUI

@MainActor /// the class must be marked as @MainActor before it is safe to update the published scrums property from the asynchronous load() method - it guarantees that modification of the published properties happen on the main thread, making it safe to use the property with a @Binding
class ScrumStore: ObservableObject { // ObservableObject is a class-constrained protocol for connecting external model data to SwiftUI views
    
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            
            // use a guard statement to optionally load the file data
            guard let data = try? Data(contentsOf: fileURL) else { return [] }
            
            let dailyScrums =  try JSONDecoder().decode([DailyScrum].self, from: data)
            
            return dailyScrums
        }
        
        let scrums = try await task.value // the type of task.value is the type that you defined in the task initializer: [DailyScrum]
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        // encoding scrums can fail so you'll need to handle any errors that occur
        let task = Task {
            // encode the scrums data
            let data = try JSONEncoder().encode(scrums)
            
            // create a constant for the file URL
            let outfile = try Self.fileURL()
            
            // write the encoded data to the file
            try data.write(to: outfile)
        }
        
        // wait for the task to complete - waiting for the task ensures that any error thrown inside the task will be reported to the caller. The underscore character indicates that you aren't interested in the result of task.value
        _ = try await task.value
    }
}
