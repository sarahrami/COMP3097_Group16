import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks = [Task]()
    
    @IBOutlet weak var tableForUpcoming: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTask(name: "Project", body: "Complete project proposal", category: "Work", date: Date(), time: Date(), status: "complete")
        createTask(name: "Gym", body: "Go grocery shopping", category: "Personal", date: Date(), time: Date(), status: "complete")
        createTask(name: "Clean Room", body: "Clean Room", category: "Personal", date: Date(), time: Date(), status: "complete")
        createTask(name: "Doctor appointment", body: "Go to the doctor", category: "Personal", date: Date(), time: Date(), status: "complete")
        //
        
        getTasks()
        
        tableForUpcoming.dataSource = self
        tableForUpcoming.delegate = self
    }
    
    func getTasks() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
        } catch {
            
        }
    }
    
    func createTask(name: String, body: String, category: String, date: Date, time: Date, status: String) {
        let newTask = Task(context: context)
        newTask.name = name
        newTask.body = body
        newTask.category = category
        newTask.date = date
        newTask.time = time
        newTask.status = status
    }
    
    func deleteTask() {
        
    }
    
    func updateTask() {
        
    }
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        
        let cell = tableForUpcoming.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = task.name
        cell.category.text = "Category: \(task.category)"
        cell.date.text = dateFormatter.string(from: task.date)
        
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
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableForUpcoming.indexPathForSelectedRow {
            let task = tasks[indexPath.row]
            
            if let dest = segue.destination as? AddTaskViewController {
                dest.task = task
            }
        }
    }
}
