//
//  LinkObject.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/02.
//

import Foundation

struct LinkObject: Hashable {
    static func == (lhs: LinkObject, rhs: LinkObject) -> Bool {
        return lhs.id == rhs.id && lhs.animal?.name == rhs.animal?.name && lhs.bird?.name == rhs.bird?.name && lhs.key == rhs.key
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(animal?.name)
        hasher.combine(bird?.name)
        hasher.combine(key)
    }
    
    var id: String
    
    var animal: Animal?
    var bird: Bird?
    var key: String?
    
    init(value: Animal) {
        self.animal = value
        self.id = value.name!
    }
    
    init(value: Bird) {
        self.bird = value
        self.id = value.name!
    }
    
    init(value: String) {
        self.key = value
        self.id = value
    }
}
