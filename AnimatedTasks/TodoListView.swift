//
//  TodoListView.swift
//  AnimatedTasks
//
//  Created by Joben Gohlke on 4/28/22.
//

import SwiftUI

struct TodoListView: View {
  @State private var todos: [Todo] = [
    Todo(description: "Take out trash"),
    Todo(description: "Walk the dog"),
    Todo(description: "Do the dishes")
  ]
  
  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomTrailing) {
        Color(UIColor.systemGroupedBackground).ignoresSafeArea()
        
        List {
          ForEach($todos) { todo in
            TodoCell(todo: todo)
              .buttonStyle(PlainButtonStyle())
          }
        }
        .listStyle(InsetGroupedListStyle())
        
        Group {
          Button(action: { }) {
            Image(systemName: "line.3.horizontal")
              .padding(24)
          }
          .background(
            Circle()
              .fill(Color.blue)
              .shadow(radius: 8, x: 4, y: 4)
          )
        }
        .font(.system(size: 20, weight: .bold))
        .accentColor(.white)
        .padding(.trailing, 20)
      }
      .navigationTitle("Remember It")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
