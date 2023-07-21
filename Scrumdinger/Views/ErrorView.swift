//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-17.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss // with the @Environment property wrapper, you can read a value that the view's environment stores, such as the view's presentation mode, scene phase, visibility or color scheme. In this case, you'll access the view's dismiss structure and call it like a function to dismiss the view
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription) // Error provides a localized string description. Id the error's user info dictionary doesn't provide a value for the description key, the system constructs a localized stirng from the domain and the code
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error")
    }
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
