//
//  EditNoteController.swift
//  Note
//
//  Created by Андрей Дашкевич on 18.10.2025.
//

import SwiftUI
internal import Combine

final class EditNoteController: ObservableObject {
    let immutableData: Note

    init(_ immutableData: Note) {
        self.immutableData = immutableData
        self.data = immutableData.content
    }

    @Published var data: String

    var markdown: AttributedString {
        (try? AttributedString(markdown: data)) ?? AttributedString()
    }
}
