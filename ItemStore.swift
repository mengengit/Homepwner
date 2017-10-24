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
        
        //let lastItem = Item(name: "No more items", serialNumber: "", valueInDollars: 0)
        //allItems.append(lastItem)

        
         let lastItem = createItem()
         lastItem.name = "No more items"
         lastItem.serialNumber = ""
         lastItem.valueInDollars = 0
    }
    
    //@@discardableResult means the caller is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        print("   Start of createItem()")
        print("    -old item count = \(allItems.count)")
        let newItem = Item(random: true)
        print("    \(newItem.name)")
        
        allItems.append(newItem)
        if allItems.count >= 2 {
            moveItem(from: (allItems.count - 2), to: (allItems.count - 1))
        }
        print("    -new item count = \(allItems.count)")
        //print("    allItems.count = \(allItems.count)")
        //print("    allItems[allItems.count - 1].name) is ***\(allItems[allItems.count - 1].name)***")
        print("   End of createItem()")
        return newItem
    }
    
    func removeItem(_ item: Item) {

        if let index = allItems.index(of: item) {
            print("ItemStore.removeItem removing item at index \(index)")
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        //Moving is simply removing and reinserting an item somewhere else
        print("ItemStore.moveItem requested moving item from position \(fromIndex) to position \(toIndex)")
        if fromIndex == toIndex {
            print("Request denied.  No action performed.  From and To values identical")
            return
        }
        
        // Get references to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        print("Move action 1 of 2 removing item")
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        print("Move action 2 of 2 inserting item in new location")
        allItems.insert(movedItem, at: toIndex)
        print("Move complete")
        
        
    }

}

