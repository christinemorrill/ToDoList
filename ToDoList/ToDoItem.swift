//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Christine Pitino on 5/20/23.
//

import Foundation

class ToDoItem: Identifiable {
    var id = UUID()
    var title = ""
    var isImportant = true
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }
}
