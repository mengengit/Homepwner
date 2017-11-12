//
//  Item.swift
//  Homepwner
//
//  Created by Mark Engen on 9/24/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    let itemKey: String
    //This delegate initializer gets info from the convenience initializer
    //In the line below, "name", "serialNumber" and "valueInDollars" are what I call "stay tuned" parameters.  We are initalizing them to something which will be declared here or passed from the convenience initializer.  In this case, only self.dateCreated has a specified actual value.
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        print("     Starting init() within Items.swift")
        self.name = name  //See convenience init
        self.valueInDollars = valueInDollars //see convenience init
        self.serialNumber = serialNumber //See convenience init
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
        print("      -not much here but initialization taking place I guess")
        print("     Exiting init() within Item.swift")
    }
    //convenience initializer passes to delegate initializer
    //When we create a new instance of the Item class (i.e. a new item), the passing argument will be formatted let something = Item(random: true/false)
    convenience init(random: Bool = false) {
        //We've been summoned!  Start here initializing missing values for Item
        print("    Starting convenience init() in Item.swift")
        if random {
            let adjectives = ["Red", "Black", "Yellow", "White"]
            print("     Our \(adjectives.count) adjectives are \(adjectives)")
            let nouns = ["Camaro", "Corvette", "Chevelle", "Ferarri"]
            print("     Our \(nouns.count) nouns are \(nouns)")
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            print("     \(randomAdjective) derived from random number \(idx) in adjective array.")
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            print("     \(randomNoun) derived from random number \(idx) in noun array.")
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(10000))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name:randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
        print("    Exiting convenience init() in Item.swift")
    }
}
