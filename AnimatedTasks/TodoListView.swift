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
  @State private var showButtons = false
  @State private var showCreateTodoView = false
  
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
          Button(action: { showCreateTodoView.toggle() }) {
            Image(systemName: "plus.rectangle")
              .padding(24)
              .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
          }
          .background(
            Circle()
              .fill(Color.blue)
              .shadow(radius: 8, x: 4, y: 4)
          )
          .offset(x: 0, y: showButtons ? -120 : 0)
          .opacity(showButtons ? 1 : 0)
          
          Button(action: { showButtons.toggle() }) {
            Image(systemName: "arrow.up.arrow.down")
              .padding(24)
              .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
          }
          .background(
            Circle()
              .fill(Color.blue)
              .shadow(radius: 8, x: 4, y: 4)
          )
          .offset(x: showButtons ? -90 : 0, y: showButtons ? -90 : 0)
          .opacity(showButtons ? 1 : 0)
          
          Button(action: { showButtons.toggle() }) {
            Image(systemName: "calendar.badge.plus")
              .padding(24)
              .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
          }
          .background(Circle()
            .fill(Color.blue)
            .shadow(radius: 8, x: 4, y: 4)
          )
          .offset(x: showButtons ? -120 : 0, y: 0)
          .opacity(showButtons ? 1 : 0)
          
          Button(action: { showButtons.toggle() }) {
            Image(systemName: "line.3.horizontal")
              .padding(24)
              .rotationEffect(Angle.degrees(showButtons ? 90 : 0))
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
        .animation(.default, value: showButtons)
      }
      .navigationTitle("Remember It")
      .fullScreenCover(isPresented: $showCreateTodoView) {
        CreateTodoView(todos: $todos, isPresented: $showCreateTodoView)
          .onAppear {
            showButtons.toggle()
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
