//
//  Todo.swift
//  AnimatedTasks
//
//  Created by Joben Gohlke on 4/28/22.
//

import Foundation

struct Todo: Identifiable {
  let id = UUID()
  var description: String
  var isCompleted: Bool = false
}
