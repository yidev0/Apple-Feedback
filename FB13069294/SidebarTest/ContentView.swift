//
//  ContentView.swift
//  SidebarTest
//
//  Created by Yuto on 2023/08/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var hide1 = false
    @State var hide2 = false
    @State var hide3 = false
    
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
    }
    
    var sidebar: some View {
        List {
            if hide1 == false {
                Label("test1", systemImage: "circle")
            }
            
            if hide2 == false {
                Label("test2", systemImage: "circle")
            }
            
            if hide3 == false {
                Label("test3", systemImage: "circle")
            }
            
            Section {
                ForEach(0..<5) { i in
                    Label("test\(i+5)", systemImage: "circle")
                }
            }
        }
    }
    
    var detailView: some View {
        Form {
            Toggle(isOn: $hide1) {
                Text("Hide 1")
            }
            
            Toggle(isOn: $hide2) {
                Text("Hide 2")
            }
            
            Toggle(isOn: $hide3) {
                Text("Hide 3")
            }
        }
    }
}

#Preview {
    ContentView()
}
