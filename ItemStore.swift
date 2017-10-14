//
//  ItemStore.swift
//  Homepwner
//
//  Created by Mark Engen on 9/24/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class ItemStore {
    //allItems is an array of type Item which is type NSObject
    var allItems = [Item]()
    var counter = 0
    init() {
        /*
        print(" Starting itemStore.swift for loop")
        for _ in 0..<5 {
            counter += 1
            print("  [\(counter)]itemStore.swift calling createItem() within for loop.")
            createItem()
        }
        print(" Exited itemStore.swift for loop")
        */
        /*
        let lastItem = Item(name: "No more items", serialNumber: "", valueInDollars: 0)
        allItems.append(lastItem)
        let lastItem = createItem()
        lastItem.name = "No more items"
        lastItem.serialNumber = ""
        lastItem.valueInDollars = 0
         */
    }
    
    //@@discardableResult means the caller is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        print("   Start of createItem()")
        let newItem = Item(random: true)
        print("    \(newItem.name)")
        
        allItems.append(newItem)
        print("    allItems.count = \(allItems.count)")
        print("    allItems[allItems.count - 1].name) is ***\(allItems[allItems.count - 1].name)***")
        print("   End of createItem()")
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get references to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
        
    }

}

