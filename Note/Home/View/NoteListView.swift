//
//  Untitled.swift
//  Note
//
//  Created by Андрей Дашкевич on 16.10.2025.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var controller: NoteListController
    
    @State private var editMode = EditMode.inactive

    var body: some View {
        List(selection: $controller.selected) {
            ForEach(controller.notes, id: \.id) { item in
                NavigationLink(value: item) {
                    NoteListCell(title: item.title, createAt: item.createAt)
                }
            }
            .onDelete{ offset in
                controller.removeByIndex(offset)
            }
            .onMove{ offset, destination in
                controller.onMove(source: offset, destination: destination)
            }
        }
        .navigationBarItems(leading: EditButton())
        .environment(\.editMode, $editMode)
    }
}

struct NoteListCell: View {
    let title: String
    let createAt: Date
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
            Text(createAt.formatted())
        }.padding(
            .vertical,
            2
        )
    }
}

#Preview{
    List{
        NavigationLink(value: "Test"){
            NoteListCell(title: "Test title", createAt: Date.now)
        }
    }
}
