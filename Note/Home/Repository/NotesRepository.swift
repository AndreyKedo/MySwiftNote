//
//  NotesRepository.swift
//  Note
//
//  Created by Андрей Дашкевич on 16.10.2025.
//

internal import Combine
import Foundation

class NotesRepository: ObservableObject {

    @Published var list: [Note] = [Note]()

    init() {
        list.append(contentsOf: [
            Note(title: "First", content: "Content **First**"),
            Note(title: "Second", content: "**Content** Second"),
            Note(title: "Three", content: "Content Three"),
            Note(title: "Four", content: "Content Four"),
            Note(title: "Five", content: "Content Five"),
        ])
    }

}
