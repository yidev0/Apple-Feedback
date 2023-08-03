//
//  SidebarView.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/02.
//

import SwiftUI

struct SidebarView: View {
    
    @FetchRequest(sortDescriptors: [])
    var animals: FetchedResults<Animal>
    
    @FetchRequest(sortDescriptors: [])
    var birds: FetchedResults<Bird>
    
    @Binding var selection: LinkObject?
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(value: LinkObject(value: "All")) {
                Text("All")
            }
//            .tag(LinkObject(value: "All"))
            
            Section {
                ForEach(animals, id: \.id) { animal in
                    NavigationLink(value: LinkObject(value: animal)) {
                        Text(animal.name!)
                    }
//                    .tag(LinkObject(value: animal))
                }
            }

            Section {
                ForEach(birds, id: \.id) { bird in
                    NavigationLink(value: LinkObject(value: bird)) {
                        Text(bird.name!)
                    }
//                    .tag(LinkObject(value: bird))
                }
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    
    @State static var selection: LinkObject? = LinkObject(value: "All")
    
    static var previews: some View {
        SidebarView(selection: $selection)
    }
}
