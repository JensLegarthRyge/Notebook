//
//  ContentView.swift
//  MyNotebook
//
//  Created by Jens Legarth Ryge on 07/02/2023.
//

import SwiftUI

//Object that represents a note entry
struct NoteEntry:Identifiable{
    var id = UUID()
    var title:String
    var body:String
}

//Main method??
struct ContentView: View {
    //Object containing note entries
    @State var noteEntries = [
        NoteEntry(title:"One (number)", body: "One is the first number if you don't count zero"),
        NoteEntry(title: "Diary", body: "Day 1: This SwiftUI is rough man"),
        NoteEntry(title: "Edit button(wip)", body: "I need to get this edit button fixed, oh well that comes later")
    ]
    
    //Visual representation
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 160.0) {
                    EditButton()
                        .frame(width: 80, height: 30)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                    Button("Add"){
                        noteEntries.append(NoteEntry(title: "New note", body: "Null"))
                    }.frame(width: 80, height: 30)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                }
                List(noteEntries.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(noteEntry: self.$noteEntries[index], noteEntries: $noteEntries)) {
                        Text(self.noteEntries[index].title)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
