//
//  ContentView.swift
//  ColorViewer
//
//  Created by Yuto on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            tab1
                .tabItem {
                    Label("iOS", systemImage: "iphone")
                }
            
            tab2
                .tabItem {
                    Label("visionOS", systemImage: "sunglasses")
                }
            
            tab3
                .tabItem {
                    Label("if iOS", systemImage: "iphone")
                }
            
            tab4
                .tabItem {
                    Label("if !iOS", systemImage: "macbook")
                }
        }
    }
    
    // expexted: green is shown in visionOS environment
    // result: red is shown in visionOS environment
    var tab1: some View {
        ZStack {
            #if os(iOS)
            Color.red
            Text("iOS")
            #elseif os(visionOS)
            Color.green
            Text("visionOS")
            #elseif os(macOS)
            Color.blue
            Text("macOS")
            #endif
        }
    }
    
    // expexted: green is shown in visionOS environment
    // result: green is shown in visionOS environment
    var tab2: some View {
        ZStack {
            #if os(visionOS)
            Color.green
            Text("visionOS")
            #elseif os(iOS)
            Color.red
            Text("iOS")
            #elseif os(macOS)
            Color.blue
            Text("macOS")
            #endif
        }
    }
    
    // expexted: blue is shown in visionOS environment
    // result: red is shown in visionOS environment
    var tab3: some View {
        ZStack {
            #if os(iOS)
            Color.red
            Text("iOS")
            #else
            Color.blue
            Text("Other than iOS")
            #endif
        }
    }
    
    // expexted: blue is shown in visionOS environment
    // result: red is shown in visionOS environment
    var tab4: some View {
        ZStack {
            #if !os(iOS)
            Color.blue
            Text("Other than iOS")
            #else
            Color.red
            Text("iOS")
            #endif
        }
    }

}

#Preview {
    ContentView()
}
