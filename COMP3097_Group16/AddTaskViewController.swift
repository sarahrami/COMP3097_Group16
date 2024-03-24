//
//  AddTaskViewController.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-02-27.
//

import UIKit

class AddTaskViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var TaskName: UITextField!
    
    @IBOutlet weak var TaskDescription: UITextField!
    
    @IBOutlet weak var TaskCategory: UITextField!
    
    @IBOutlet weak var TaskDate: UIDatePicker!
    
    @IBOutlet weak var TaskTime: UIDatePicker!
    
    @IBAction func AddTaskButton(_ sender: Any) {
        
        let name = TaskName.text ?? ""
        let description = TaskDescription.text ?? ""
        let category = TaskCategory.text ?? ""
        let date = TaskDate.date
        let time = TaskTime.date
        let status = "Pending"
        
        createTask(name: name, body: description, category: category, date: date, time: time, status: status)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createTask(name: String, body: String, category: String, date: Date, time: Date, status: String) {
        let newTask = Task(context: context)
        newTask.name = name
        newTask.body = body
        newTask.category = category
        newTask.date = date
        newTask.time = time
        newTask.status = status
        
        do {
            try context.save()
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
