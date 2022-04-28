//
//  TodoCell.swift
//  AnimatedTasks
//
//  Created by Joben Gohlke on 4/28/22.
//

import SwiftUI

struct TodoCell: View {
  @Binding var todo: Todo
  @State private var animationRunning = false
  
  var body: some View {
    HStack {
      if todo.isCompleted {
        Text(todo.description).strikethrough()
          .foregroundColor(.gray)
      } else {
        Text(todo.description)
      }

      Spacer()

      Button(action: { todo.isCompleted.toggle() }) {
        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
          .foregroundColor(todo.isCompleted ? .blue : .gray)
          .font(.title2)
          .overlay(
            Circle()
              .stroke(Color.blue, lineWidth: 2)
              .scaleEffect(todo.isCompleted ? 2 : 0)
              .opacity(todo.isCompleted ? 0 : 1)
          )
          .animation(.easeOut(duration: 0.6), value: todo.isCompleted)
      }
    }
    .animation(.easeIn, value: todo.isCompleted)
  }
}

struct TodoCell_Previews: PreviewProvider {
  static var previews: some View {
    TodoCell(todo: .constant(Todo(description: "Take out trash")))
      .previewLayout(.sizeThatFits)
    
    TodoCell(todo: .constant(Todo(description: "Wash the dishes", isCompleted: true)))
      .previewLayout(.sizeThatFits)
  }
}
