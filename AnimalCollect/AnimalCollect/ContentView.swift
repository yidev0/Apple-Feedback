//
//  ContentView.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/02.
//

import SwiftUI
import CoreData

struct ContentView: View {

    // MARK: Issue
    // How can I store this value, in a way which it is restorable
    @State var selection: LinkObject? = LinkObject(value: "All")
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
        } detail: {
            DetailView(selection: selection)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
