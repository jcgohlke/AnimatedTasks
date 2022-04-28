//
//  TodoCell.swift
//  AnimatedTasks
//
//  Created by Joben Gohlke on 4/28/22.
//

import SwiftUI

struct TodoCell: View {
  @Binding var todo: Todo
  
  var body: some View {
    HStack {
      Text(todo.description)

      Spacer()

      Button(action: { todo.isCompleted.toggle() }) {
        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
          .foregroundColor(todo.isCompleted ? .blue : .gray)
          .font(.title2)
      }
    }
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
