//
//  ContentView.swift
//  ToDoList
//
//  Created by Christine Pitino on 5/20/23.
//

import SwiftUI

struct ContentView: View {
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
                                
            }) {
                Text("+")
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.895, saturation: 0.582, brightness: 0.971))
                    .font(.system(size: 20))
                
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
