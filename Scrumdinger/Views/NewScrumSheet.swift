//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-12.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false // isPresentingNewScrumView is a binding to a source of truth so updating it will update the source of truth in the app
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum) // the scrums array is a binding so updating the array in this view will update the source of truth contained in the app 
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}


struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
