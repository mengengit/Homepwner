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
        print(" Starting itemStore.swift for loop")
        for _ in 0..<2 {
            counter += 1
            print("  [\(counter)]itemStore.swift calling createItem() within for loop.")
            createItem()
        }
        print(" Exited itemStore.swift for loop")
        allItems[1].name = "Jack-O-Lantern"
        
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
    
    

}

