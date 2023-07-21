//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Yu Yun Liu on 2023-07-15.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
