//
//  NewDetailView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-12.
//

import SwiftUI

struct NewDetailView: View {
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    
    var body: some View {
        
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            scrum = editingScrum
                            isPresentingEditView = false
                        }
                    }
                }
        }
        .onAppear {
            editingScrum = scrum
        }
    }
}


struct NewDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewDetailView(scrum: .constant(DailyScrum.sampleData[0]), isPresentingEditView: .constant(true))
    }
}
