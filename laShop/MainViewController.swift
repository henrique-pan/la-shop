//=======================================
import UIKit
//=======================================
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------------//--------------------------- MARK: -------> IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePickerFrom: UIDatePicker!
    @IBOutlet weak var datePickerTo: UIDatePicker!
    //---------------------------//--------------------------- MARK: -------> Properties
    var titles = ["CAMÉRAS", "LENTILLES", "TRÉPIEDS"]
    var numberOfElementsInSections = [12, 5, 3]
    //---------------------------//--------------------------- MARK: -------> viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerFrom.setValue(UIColor.white, forKeyPath: "textColor")
        datePickerFrom.setValue(false, forKeyPath: "highlightsToday")
        datePickerTo.setValue(UIColor.white, forKeyPath: "textColor")
        datePickerTo.setValue(false, forKeyPath: "highlightsToday")
        
    }
    //---------------------------//--------------------------- MARK: -------> TableView Section Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        //title.font = UIFont(name: "MyriadPro-Regular", size: 20)!
        title.textColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = UIColor(red: (111/255), green: (96/255), blue: (73/255), alpha: 1.0)
        header.textLabel?.font = title.font
        header.textLabel?.textColor = title.textColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return numberOfElementsInSections[section]
    }
    //---------------------------//--------------------------- MARK: -------> TableView Stuff
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:Parser = self.tableView.dequeueReusableCell(withIdentifier: "shop") as! Parser
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //-----------------------------------
}
//=======================================









