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
    
    var tasks = [Task]()
    
    @IBOutlet weak var tableForUpcoming: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = Task(name: "Project", description: "Complete project proposal", category: "Work", date: "23-02-2024", time: "09:00", status: "complete")
        let task2 = Task(name: "Gym", description: "Go grocery shopping", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        let task3 = Task(name: "Clean Room", description: "Clean Room", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        let task4 = Task(name: "Doctor appointment", description: "Go to the doctor", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        
        tasks = [task1, task2, task3, task4]
        
        tableForUpcoming.dataSource = self
        tableForUpcoming.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = tableForUpcoming.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = task.name
        cell.category.text = "Category: \(task.category)"
        cell.date.text = task.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController {
            viewController.task = task
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableForUpcoming.indexPathForSelectedRow {
            let task = tasks[indexPath.row]
            
            if let dest = segue.destination as? AddTaskViewController {
                dest.task = task
            }
        }
    }
}
