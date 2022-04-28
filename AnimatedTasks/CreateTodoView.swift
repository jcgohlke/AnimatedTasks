//
//  CreateTodoView.swift
//  AnimatedTasks
//
//  Created by Joben Gohlke on 4/28/22.
//

import SwiftUI

struct CreateTodoView: View {
  @Binding var todos: [Todo]
  @Binding var isPresented: Bool
  
  @State private var todoDescription = ""
  @State private var isCompleted = false
  @State private var dueDate = Date()
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Todo description", text: $todoDescription)
        
        DatePicker("Due Date", selection: $dueDate)
        
        Toggle("Completed", isOn: $isCompleted)
        
        Button("Create", action: {
          todos.append(Todo(description: todoDescription, isCompleted: isCompleted))
          isPresented.toggle()
        })
        .disabled(todoDescription.isEmpty)
      }
      .navigationTitle("Create Todo")
    }
  }
}

struct CreateTodoView_Previews: PreviewProvider {
  static var previews: some View {
    CreateTodoView(todos: .constant(previewTodos), isPresented: .constant(true))
  }
}
