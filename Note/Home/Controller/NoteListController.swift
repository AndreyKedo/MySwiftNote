//
//  NoteListController.swift
//  Note
//
//  Created by Андрей Дашкевич on 16.10.2025.
//

import SwiftUI
internal import Combine

class NoteListController: ObservableObject {
    
    let repository: NotesRepository
    
    var _subscription: AnyCancellable?
    @Published var notes = [Note]()
    
    @Published
    var selected: Note? = nil
    
    init(_ repository: NotesRepository) {
        self.repository = repository
        self.notes = repository.list
        
        _subscription = repository.objectWillChange.sink{ _ in
            self.notes = repository.list
        }
    }
    
    func removeByIndex(_ index: IndexSet){
        notes.remove(atOffsets: index)
        selected = nil
    }
    
    func onMove(source: IndexSet, destination: Int) {
        notes.move(fromOffsets: source, toOffset: destination)
     }
    
    
    deinit{
        _subscription?.cancel()
    }
}
