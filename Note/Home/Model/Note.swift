//
//  Note.swift
//  Note
//
//  Created by Андрей Дашкевич on 15.10.2025.
//

import Foundation
import SwiftUI

struct Note: Identifiable, Hashable {
    let id: UUID
    let title: String
    let createAt: Date
    let content: String

    init(id: UUID = UUID(), title: String, createAt: Date = Date.now, content: String) {
        self.title = title
        self.id = id
        self.content = content
        self.createAt = createAt
    }
    
    func toEditNote() -> EditNote {
        EditNote(
            self
        )
    }
}

extension Note: Changeable {
    init(copy: ChangeableWrapper<Self>) {
        self.init(id: copy.id, title: copy.title, createAt: copy.createAt, content: copy.content)
    }
}
struct EditNote: Identifiable, Hashable {
    let id: UUID
    var content: String

    init(_ value: Note) {
        self.id = value.id
        self.content = value.content
    }
}
