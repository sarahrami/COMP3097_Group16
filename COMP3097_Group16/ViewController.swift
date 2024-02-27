import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
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
        let task4 = Task(name: "Doctor appointment", description: "Go to the docotr", category: "Personal", date: "23-02-2024", time: "17:30", status: "complete")
        
        
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        tasks.append(task4)
        
        tableForUpcoming.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataTask = tasks[indexPath.row]
        let cell = tableForUpcoming.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = dataTask.name
        cell.category.text = "Category: "+dataTask.category
        cell.date.text = "\(dataTask.date)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
