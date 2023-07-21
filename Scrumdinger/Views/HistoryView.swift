//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-20.
//

import SwiftUI


struct HistoryView: View {
    let history: History


    var body: some View {
        // scroll view is a container view that supports horizontal or vertical scrolling
        // a list view automatically embeds itself in a scroll view
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)

                
                // use optional binding to see if there is a transcript (safely unwrap value of transcript)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [
            DailyScrum.Attendee(name: "Jon"),
            DailyScrum.Attendee(name: "Darla"),
            DailyScrum.Attendee(name: "Luis")
        ],
                transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    static var previews: some View {
        HistoryView(history: history)
    }
}
