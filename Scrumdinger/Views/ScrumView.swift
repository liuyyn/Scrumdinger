//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-05.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        
       NavigationStack {
           // The $ prefix accesses the projectedValue of a wrapped property. The projected value of the scrums binding is another binding.
           // this is an array binding syntax
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
       .sheet(isPresented: $isPresentingNewScrumView) {
           NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
       }
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumView(scrums: .constant(DailyScrum.sampleData))
    }
}
