//
//  ContentView.swift
//  ToDoList
//
//  Created by Christine Pitino on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
   
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack() {
                Text("To Do List")
                    .fontWeight(.black)
                    .foregroundColor(Color(hue: 0.545, saturation: 1.0, brightness: 1.0, opacity: 0.982))
                    .font(.system(size: 30))
                Spacer()
            }
            .padding()
            
            Button(action: {
                self.showNewTask = true
            }) {
                Text("+")
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.895, saturation: 0.582, brightness: 0.971))
                    .font(.system(size: 20))
                
            }
            Spacer()
            
            
            List {
                ForEach (toDoItems) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + (toDoItem.title ?? "No title"))
                    } else {
                        Text(toDoItem.title ?? "No title")
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, title: "", isImportant: false)
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
