//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Christine Pitino on 5/20/23.
//

import SwiftUI

struct NewToDoView: View {
    @Binding var toDoItems: [ToDoItem]
    @Binding var showNewTask : Bool
    @State var title: String
    @State var isImportant: Bool
    
    var body: some View {
        VStack {
            Text("Add a new task")
                .fontWeight(.semibold)
                .foregroundColor(Color(hue: 0.545, saturation: 0.971, brightness: 0.619, opacity: 0.982))
                .font(.system(size: 20))
            TextField("Enter the task description", text: $title)
                .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                      .padding()
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
                    .padding()
                    .foregroundColor(Color(hue: 0.545, saturation: 0.971, brightness: 0.619, opacity: 0.982))
                    .font(.system(size: 15))
            }
                Button(action: {
                    self.addTask(title: self.title, isImportant: self.isImportant)
                    self.showNewTask = false
                    
                }) {
                    Text("Add task")
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(Color(hue: 0.878, saturation: 0.971, brightness: 0.619, opacity: 0.982))
                        .frame(width: 100.0, height: 25.0)
                        .background(Color("purpleblue"))
                        .cornerRadius(20)

                }
            }
        }
    
    private func addTask(title: String, isImportant: Bool = false) {
            
            let task = ToDoItem(title: title, isImportant: isImportant)
            toDoItems.append(task)
        }
    }


struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(toDoItems: .constant ([]), showNewTask: .constant(true), title: "", isImportant: false)
    }
}
