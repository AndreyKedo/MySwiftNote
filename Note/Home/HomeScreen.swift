//
//  ContentView.swift
//  note
//
//  Created by Андрей Дашкевич on 14.10.2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var cotroller = NoteListController(NotesRepository())

    var body: some View {
        NavigationSplitView {
            NoteListView()

        } detail: {
            NoteDetailView(data: cotroller.selected)
        }.environmentObject(cotroller)
    }
}
