
import UIKit

class TableViewController: UITableViewController {
    var list = [TableData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let obj = TableData(section: sectionData(title: "Section 1", data: ["cell 1", "cell 2", "cell 3"]))
       list.append(obj)
        let obj1 = TableData(section: sectionData(title: "Section 2", data: ["cell 1"]))
        list.append(obj1)
        let obj2 = TableData(section: sectionData(title: "Section 3", data: ["cell 1", "cell 2", "cell 3","cell 4"]))
        list.append(obj2)
        let obj3 = TableData(section: sectionData(title: "Section 4", data: ["cell 1", "cell 2"]))
        list.append(obj3)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list[section].isExpanded == true {
            return list[section].sections.data.count
        }
           return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lbl = UILabel()
        lbl.tag = section
        lbl.text = list[section].sections.title
        lbl.backgroundColor = UIColor.init(hexString: "33CCCC")
        lbl.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        lbl.addGestureRecognizer(gesture)
        
        return lbl
    }
 
    
    @objc func tapped(sender: UITapGestureRecognizer){
        guard let lbl = sender.view else {return}
        print(lbl.tag)
        if list[lbl.tag].isExpanded == true {
            list[lbl.tag].isExpanded = false
           // tableView.reloadData()
            let sec = IndexSet(integer: lbl.tag)
           tableView.reloadSections(sec, with: .fade)
        }else{
            list[lbl.tag].isExpanded = true
            // tableView.reloadData()
            let sec = IndexSet(integer: lbl.tag)
            tableView.reloadSections(sec, with: .fade)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.section].sections.data[indexPath.row]
        return cell
    }
    
    

}

