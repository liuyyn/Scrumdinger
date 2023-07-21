//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-19.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where:  { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                // because the default alignment for an overlay is .centered, adding a text view to a layer in front of the circle makes the text appear in the center of the circle
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine) // makes the voiceover read the two text views as one sentence
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id}) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90)) // moves the anfle to the 12 o'clock position
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
                
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]    }
    static var previews: some View {
        MeetingTimerView(speakers: speakers, isRecording: true, theme: .yellow)
    }
}
