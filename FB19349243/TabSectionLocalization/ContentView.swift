//
//  ContentView.swift
//  TabSectionLocalization
//
//  Created by Yuto on 2025/08/04.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: String?
    
    var body: some View {
        headerNotLocalized
    }
    
    var headerNotLocalized: some View {
        TabView(selection: $selection) {
            TabSection("Title1") {
                Tab("Content1-1", systemImage: "circle", value: "1-1") {
                    
                }
            }
            
            TabSection("Title2") {
                Tab(value: "2-1") {
                    
                } label: {
                    Text("Content2-1")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
    
    // Work around 1: Use LocalizedStringKey
    var expectedResult1: some View {
        TabView(selection: $selection) {
            TabSection(LocalizedStringKey("Title1")) {
                Tab("Content1-1", systemImage: "circle", value: "1-1") {
                    
                }
            }
            
            TabSection(LocalizedStringKey("Title2")) {
                Tab(value: "2-1") {
                    
                } label: {
                    Text("Content2-1")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
    
    // Work around 2: Use TabSection(content: , header: )
    var expectedResult2: some View {
        TabView(selection: $selection) {
            TabSection {
                Tab("Content1-1", systemImage: "circle", value: "1-1") {
                    
                }
            } header: {
                Text("Title1")
            }
            
            TabSection {
                Tab(value: "2-1") {
                    
                } label: {
                    Text("Content2-1")
                }
            } header: {
                Text("Title2")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
    
    // Work around 3: Don't use TabView's selection
    var expectedResult3: some View {
        TabView {
            TabSection("Title1") {
                Tab("Content1-1", systemImage: "circle") {
                    
                }
            }
            
            TabSection("Title2") {
                Tab {
                    
                } label: {
                    Text("Content2-1")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview("Header not localized") {
    ContentView().headerNotLocalized
        .environment(\.locale, .init(identifier: "ja"))
}

#Preview("Expected result 1") {
    ContentView().expectedResult1
        .environment(\.locale, .init(identifier: "ja"))
}

#Preview("Expected result 2") {
    ContentView().expectedResult2
        .environment(\.locale, .init(identifier: "ja"))
}


#Preview("Expected result 3") {
    ContentView().expectedResult2
        .environment(\.locale, .init(identifier: "ja"))
}
