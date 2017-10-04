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
    let dateCreated: Date

    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        print("     Starting init() within Items.swift")
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
        print("      -not much here but initialization taking place I guess")
        print("     Exiting init() within Item.swift")
    }
    
    convenience init(random: Bool = false) {
        print("    Starting convenience init() in Item.swift")
        if random {
            let adjectives = ["Shiny", "Rusty", "Vintage", "Classic"]
            print("     Our \(adjectives.count) adjectives are \(adjectives)")
            let nouns = ["Motorcycle", "Ferarri"]
            print("     Our \(nouns.count) nouns are \(nouns)")
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            print("     \(randomAdjective) derived from random number \(idx) in adjective array.")
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            print("     \(randomNoun) derived from random number \(idx) in noun array.")
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
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
