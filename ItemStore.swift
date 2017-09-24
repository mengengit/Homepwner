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

    init() {
        for _ in 0..<5 {
            createItem()
        }
        allItems[4].name = "Jack-O-Lantern"
        
    }
    
    //@@discardableResult means the caller is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        print(newItem.name)
        
        allItems.append(newItem)
        print("allItems.count = \(allItems.count)")
        print("allItems[allItems.count - 1].name) is ***\(allItems[allItems.count - 1].name)***")
        return newItem
    }
    
    

}

