import UIKit
import CoreData

class IncompleteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks = [Task]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var incompleteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        incompleteTable.dataSource = self
        incompleteTable.delegate = self

        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "status == %@", "Pending") 
        do {
            tasks = try context.fetch(fetchRequest)
            print(tasks)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = task.name
        cell.category.text = "Category: \(task.category ?? "")"
        cell.date.text = dateFormatter.string(from: task.date ?? Date())
        
        return cell
    }
}
