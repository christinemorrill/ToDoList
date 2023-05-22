//
//  ContentView.swift
//  ToDoList
//
//  Created by Christine Pitino on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems: [ToDoItem] = []
   
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
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(toDoItems: $toDoItems,showNewTask: $showNewTask, title: "", isImportant: false)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
