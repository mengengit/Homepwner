//
//  ItemStore.swift
//  Homepwner
//
//  Created by Mark Engen on 9/24/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()

    init() {
        for _ in 0..<5 {
            createItem()
        }
    }

    //@@discardableResult means the caller is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}

/*
 import Foundation
 
 class ItemStore {
 
 var allItems: [Item] = []
 
 init() {
 for _ in 0..<5 {
 createItem()
 }
 }
 
 @discardableResult func createItem() -> Item {
 let newItem = Item(random: true)
 
 allItems.append(newItem)
 
 return newItem
 }
 
 }
*/
