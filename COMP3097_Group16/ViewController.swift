import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    struct Task {
        let name: String
        let description: String
        let category: String
        let date: String
        let time: String
        let status: String
        
        init(name: String, description: String, category: String, date: String, time: String, status: String) {
            self.name = name
            self.description = description
            self.category = category
            self.date = date
            self.time = time
            self.status = status
        }
    }
    
    var tasks = [String: [Task]]()
    
    @IBOutlet weak var tableForUpcoming: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = Task(name: "Project", description: "Complete project proposal", category: "Work", date: "23-02-2024", time: "09:00", status: "complete")
        let task2 = Task(name: "Gym", description: "Go grocery shopping", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        let task3 = Task(name: "Clean Room", description: "Clean Room", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        let task4 = Task(name: "Doctor appointment", description: "Go to the doctor", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        
        tasks = ["Work": [task1], "Personal": [task2, task3, task4]]
        
        tableForUpcoming.dataSource = self
        tableForUpcoming.delegate = self // Set delegate to self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = Array(tasks.keys)[section]
        return tasks[category]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = Array(tasks.keys)[indexPath.section]
        let task = tasks[category]![indexPath.row]
        
        let cell = tableForUpcoming.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = task.name
        cell.category.text = "Category: \(task.category)"
        cell.date.text = task.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(tasks.keys)[section]
    }
    
    // Handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = Array(tasks.keys)[indexPath.section]
        let task = tasks[category]![indexPath.row]
        
        // Perform navigation
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController {
            viewController.task = task
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        // Deselect the row after navigation
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let indexPath = tableForUpcoming.indexPathForSelectedRow {
                let category = Array(tasks.keys)[indexPath.section]
                let task = tasks[category]![indexPath.row]
                
                if let dest = segue.destination as? AddTaskViewController {
                    dest.task = task
                }
            }
        }
}
