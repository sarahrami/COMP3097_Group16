//
//  EditTaskViewController.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-03-23.
//

import UIKit

class EditTaskViewController: UIViewController {
    var task: Task? = nil;
    
    @IBOutlet weak var TaskName: UITextField!
    
    @IBOutlet weak var TaskDescription: UITextField!
    
    @IBOutlet weak var TaskCategory: UITextField!
    
    @IBOutlet weak var TaskDate: UIDatePicker!
    
    @IBOutlet weak var TaskTime: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = task {
            TaskName.text = data.name
            TaskDescription.text = data.body
            TaskCategory.text = data.category
            TaskDate.date = data.date
            TaskTime.date = data.time
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
