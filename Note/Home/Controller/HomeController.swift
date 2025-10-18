//
//  HomeController.swift
//  Note
//
//  Created by Андрей Дашкевич on 15.10.2025.
//

import SwiftUI
internal import Combine

class HomeController : ObservableObject {
 
    @Published var notes = [Note]()
    
    
    func addNewNote(_ note: Note){
        notes.append(note)
    }
}
