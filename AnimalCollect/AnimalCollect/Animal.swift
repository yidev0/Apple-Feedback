//
//  Animal.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/02.
//

import Foundation

struct Animal: Identifiable {
    var id: String = UUID().uuidString
    
    let name: String
}
