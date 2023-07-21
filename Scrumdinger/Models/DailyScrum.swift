//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-06-20.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes) // for swift functions that return a value, you can omit the return keyword when the body is a single expression
        }
        
        set {
            lengthInMinutes = Int(newValue) // you can provide an argument to the seter to name the newly set value. If you omit the argument, the setter uses newValue as the default name 
        }
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map {Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        // initializer that assigns a default value to the id property
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

// extension to provide some sample data
extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design",
                          attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                          lengthInMinutes: 10,
                          theme: .yellow),
               DailyScrum(title: "App Dev",
                          attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                          lengthInMinutes: 5,
                          theme: .orange),
               DailyScrum(title: "Web Dev",
                          attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                          lengthInMinutes: 5,
                          theme: .poppy)
    ]
}
