//
//  AddTaskViewController.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-02-27.
//

import UIKit

class AddTaskViewController: UIViewController {
    var task: ViewController.Task! = nil;
    
    @IBOutlet weak var TaskName: UITextField!
    
    @IBOutlet weak var TaskDescription: UITextField!
    
    @IBOutlet weak var TaskCategory: UIButton!
    
    @IBOutlet weak var TaskDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = task {
            TaskName.text = data.name
            TaskDescription.text = data.description
            TaskCategory.setTitle(data.category, for: .normal)
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
