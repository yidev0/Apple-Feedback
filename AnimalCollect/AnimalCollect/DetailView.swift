//
//  DetailView.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/03.
//

import SwiftUI

struct DetailView: View {
    
    var selection: LinkObject?
    
    var body: some View {
        if let animal = selection?.animal {
            Text(animal.name!)
        } else if let bird = selection?.bird {
            Text(bird.name!)
        } else {
            Text("All")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
