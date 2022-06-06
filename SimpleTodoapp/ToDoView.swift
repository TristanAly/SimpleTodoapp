//
//  ToDoView.swift
//  SimpleTodoapp
//
//  Created by Tristan Aly on 06/06/2022.
//

import SwiftUI

struct ToDoView: View {
    
    @Environment(\.managedObjectContext) private var vc
    @State private var taskTitle: String = ""
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) private var  tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("enter task", text:  $taskTitle)
                    .textFieldStyle(.roundedBorder)
                Button{
                    // save the task to the database
                    
                    let task =  Task(context: vc)
                    task.title = taskTitle
                    
                    do {
                       try vc.save()
                    } catch {
                        print(error)
                    }
                    
                    
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent)
//                List(tasks){ task in
//                    Text(task.title ?? "")
//
//                }
                
                List{
                    ForEach(tasks) { task in
                        Text(task.title ?? "" )
                    }.onDelete { indexSet in
                        indexSet.forEach { index in
                            let taskToDelete = tasks[index]
                            vc.delete(taskToDelete)
                            
                            do{
                            try vc.save()
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            }.padding()
            
            .navigationBarTitle("TodoApp")
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
