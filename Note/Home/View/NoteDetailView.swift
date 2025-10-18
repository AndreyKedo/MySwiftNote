//
//  NoteDetailView.swift
//  Note
//
//  Created by Андрей Дашкевич on 17.10.2025.
//

import SwiftUI

struct NoteDetailView: View {
    var data: Note?

    var body: some View {
        if let note = data {
            EditableNoteView(note)
        } else {
            Text("")
        }
    }
}

struct EditableNoteView: View {
    @State private var editMode = EditMode.inactive

    @ObservedObject var editableModel: EditNoteController

    init(_ note: Note) {
        self.editableModel = EditNoteController(note)
    }

    var body: some View {
        VStack {
            if editMode.isEditing {
                TextEditor(text: $editableModel.data)
                    .autocorrectionDisabled()
                    .padding()
                    .textInputAutocapitalization(.none)
            } else {
                ScrollView {
                    Text(editableModel.markdown)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .init(horizontal: .leading, vertical: .top)
                        )
                        .padding()
                }
            }
        }
        .navigationTitle(editableModel.immutableData.title)
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, $editMode)

    }
}

#Preview {
    NavigationStack {
        EditableNoteView(Note(title: "Test title", content: "Test more content"))
    }
}
