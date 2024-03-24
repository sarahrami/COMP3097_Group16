import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks = [Task]()
    
    @IBOutlet weak var tableForUpcoming: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTasks()
        
        tableForUpcoming.dataSource = self
        tableForUpcoming.delegate = self
    }
  
    // MARK: CoreData
    func getTasks() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
            DispatchQueue.main.async {
                self.tableForUpcoming.reloadData()
            }
        } catch {
            print("Error: \(error)")
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
        
        do {
            try context.save()
        } catch {
            print("Error: \(error)")
        }
    }
    
    func deleteTask(task: Task) {
        context.delete(task)
        
        do {
            try context.save()
        } catch {
            print("Error: \(error)")
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
        } catch {
            print("Error: \(error)")
        }
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
        
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as? EditTaskViewController {
            viewController.task = task
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                tableView.deleteRows(at: [indexPath], with: .fade)
//                deleteTask(task: <#T##Task#>)
            } else if editingStyle == .insert {
            }
        }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableForUpcoming.indexPathForSelectedRow {
            let task = tasks[indexPath.row]
            
            if let dest = segue.destination as? EditTaskViewController {
                dest.task = task
            }
        }
    }
}
