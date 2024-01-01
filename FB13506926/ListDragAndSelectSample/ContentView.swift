//
//  ContentView.swift
//  ListDragAndSelectSample
//
//  Created by Yuto on 2024/01/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var color2: Color? = nil
    @State var color1: String? = nil
    
    @State var sidebarItems: [String] = [
        "aaa",
        "bbb",
        "ccc",
        "ddd",
    ]
    
    @State var selected: String? = "aaa"
    
    var body: some View {
        NavigationStack {
            List(selection: $selected) {
                ForEach(sidebarItems, id: \.self) { str in
                    NavigationLink(value: str) {
                        Label(str, systemImage: "folder")
                    }
                    // Removing .onDrag will fix this issue
                    .onDrag {
                        return NSItemProvider(
                            object: str as NSItemProviderWriting
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

