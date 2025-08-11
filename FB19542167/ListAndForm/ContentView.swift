//
//  ContentView.swift
//  ListAndForm
//
//  Created by Yuto on 2025/08/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                Form {
                    content
                }
#if os(macOS)
                .formStyle(.grouped)
#endif
            } label: {
                Text(verbatim: "Form")
            }
            
            Tab {
                List {
                    content
                }
            } label: {
                Text(verbatim: "List")
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ForEach(0..<5) { i in
            Section {
                ForEach(0..<2) { j in
                    Text(i * 10 + j, format: .number)
                }
            } header: {
                Text(i, format: .number)
            }
            // Following action only appears when used inside a List
            .sectionActions {
                Button {
                    print("Action\(i)!")
                } label: {
                    Text(verbatim: "This is a Section Action")
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
