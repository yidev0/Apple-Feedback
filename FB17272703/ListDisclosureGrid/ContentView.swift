//
//  ContentView.swift
//  ListDisclosureGrid
//
//  Created by Yuto on 2025/04/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            DisclosureGroup {
                LazyVGrid(
                    columns: [
                        GridItem(
                            .adaptive(minimum: 40, maximum: 80),
                            spacing: 6
                        )
                    ],
                    spacing: 4
                ) {
                    ForEach(0..<43) { symbol in
                        Circle()
                    }
                }
                .listRowInsets(.init(top: 6, leading: 0, bottom: 6, trailing: 8))
            } label: {
                Text("Header")
            }
        }
    }
}

#Preview {
    ContentView()
}
