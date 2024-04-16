//
//  EditTaskViewController.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-03-23.
//

import UIKit

class EditTaskViewController: UIViewController {
    var task: Task? = nil;
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var TaskName: UITextField!
    
    @IBOutlet weak var TaskDescription: UITextField!
    
    @IBOutlet weak var TaskCategory: UITextField!
    
    @IBOutlet weak var TaskDate: UIDatePicker!
    
    @IBOutlet weak var TaskTime: UIDatePicker!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    @IBAction func UpdateTaskBtn(_ sender: Any) {
        
        toggleCompleted(completedSwitch)
        self.navigationController?.popViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = task {
            TaskName.text = data.name
            TaskDescription.text = data.body
            TaskCategory.text = data.category
            TaskDate.date = data.date
            TaskTime.date = data.time
            completedSwitch.isOn = data.status == "Completed"
        }
    }
    @IBAction func toggleCompleted(_ sender: UISwitch) {
        if let task = task {
            
            task.status = sender.isOn ? "Completed" : "Pending"
            let newName = TaskName.text ?? ""
            let newBody = TaskDescription.text ?? ""
            let newCategory = TaskCategory.text ?? ""
            let newDate = TaskDate.date
            let newTime = TaskTime.date
            
            updateTask(task: task, name: newName, body: newBody, category: newCategory, date: newDate, time: newTime, status: task.status)
        }
        
    }
    func updateTask(task: Task, name: String?, body: String?, category: String?, date: Date?, time: Date?, status: String?) {
        if let newName = name {
            task.name = newName
        }
        if let newBody = body {
            task.body = newBody
        }
        if let newCategory = category {
            task.category = newCategory
        }
        if let newDate = date {
            task.date = newDate
        }
        if let newTime = time {
            task.time = newTime
        }
        if let newStatus = status {
            task.status = newStatus
        }
        
        do {
            try context.save()
            print("Task updated successfully")
        } catch {
            print("Error: \(error)")
        }
    }
    

   
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
