//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-12.
//

import SwiftUI

struct MeetingFooterView: View {
    
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void // allows users to skip to the next speaker
    
    private var speakerNumber: Int? {
        // the first speaker not marrked as completed becomes the active speaker
        guard let index = speakers.firstIndex(where: { !$0.isCompleted}) else { return nil }
        
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber =  speakerNumber else { return "No more speakers" }
        
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        
        VStack {
            HStack {
                
                if isLastSpeaker {
                    Text("Last Speaker")
                }
                else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    
    static var previews: some View {
        // see extention in ScrumTimer for speakers
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
