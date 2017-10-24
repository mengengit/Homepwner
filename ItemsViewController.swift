//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Mark Engen on 9/24/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!

    // Add button
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
        
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    // Edit button
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated:true)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(" Starting override func tableView-A")
        return itemStore.allItems.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" Started viewDidLoad() from ItemsViewController.swift")
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        //Table to start under statusBar
        tableView.contentInset = insets
        
        //Scroll indicators to start under statusBar as well
        tableView.scrollIndicatorInsets = insets
        
        //tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        print(" Ending viewDidLoad() from ItemsViewController.swift")
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(" Starting override func tableView-B")
        /*
        //Create an instance of UITableViewCell, with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        */
        
        // Get a new or recycled cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        print("indexPath.row = \(indexPath.row)")
        let item = itemStore.allItems[indexPath.row]
        //cell.textLabel?.text = item.name //+ " S/N " + item.serialNumber!
        //cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        
        // Configure the cell with the Item
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        
        print(" Exiting override func tableView-B")
        //Cell is green if less than 5000, red otherwist
        if item.valueInDollars < 5000 {
            
            cell.backgroundColor = UIColor.green
            
        }else if item.valueInDollars >= 5000 {
            
            cell.backgroundColor = UIColor.red
        }
        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        print ("editingStyle = (editingStyle)")
        let ProtectedRowIndex = itemStore.allItems.count - 1
        let canRemove = (indexPath.row != ProtectedRowIndex) //true or false
        if editingStyle == .delete {
            //print("Attempting to delte indexPath.row \(indexPath.row) with allItems.count of \(itemStore.allItems.count)")
            let item = itemStore.allItems[indexPath.row]
            var message: String
            var title: String
            
            switch canRemove {
            case true:
                message = "Are you sure you want to delete this item?"
                title = "Delete \(item.name)?"
            case false:
                message = "Not allowed to delete last row!"
                title = ""
            }
            
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            
            //page 207 explains this closure in the handler
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                // Remove the item from the store
                self.itemStore.removeItem(item)
                
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                                            
            })
            if canRemove {ac.addAction(deleteAction)}
            
            // Present the alert controller modally page 207 i.e. on top of the view
            present(ac, animated: true, completion: nil)
            
        }

    }
    
    //This function allows the "move" operation to take place in the table view.  In addition, it gives us an opportunity to update the datasource to match the table veiw.  Without this function, no rows could be moved. Page 203
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // UPdate the model as well
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Disable editing the last row
        if indexPath.row == itemStore.allItems.count - 1 /* last row */ {
            return false
        } else {
        return true
        }
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        // We see what is proposed in a move.  Now we can manipulate the results as we see fit
        print("Requesting that row \(sourceIndexPath.row) be moved to position \(proposedDestinationIndexPath.row)")
        var modifiedPath:IndexPath = proposedDestinationIndexPath
        
        if modifiedPath.row == itemStore.allItems.count - 1 {
            modifiedPath.row -= 1
            print("Nope.  Request to move items to the end of the list denied. ERROR: Prohibited from moving past last item")
            print("Instead, let's try to move it to the 2nd to last slot.")
            return modifiedPath
        } else {
            return modifiedPath
        }
        
    }
}
