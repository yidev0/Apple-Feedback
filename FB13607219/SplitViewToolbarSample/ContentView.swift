import SwiftUI

struct ContentView: View {
    @State var selected: Int? = 0
    
    var body: some View {
        NavigationSplitView {
//            Removing "selection" fixes the issue
//            List {
            List(selection: $selected) {
                ForEach(0..<5) { i in
                    NavigationLink(value: i) {
                        Text("\(i)")
                    }
                }
            }
            .listStyle(.sidebar)
        } detail: {
            ZStack {
                Link(destination: URL(string: "https://apple.com")!) {
                    Text("Open browser")
                }
            }
            .toolbar {
                Text("Hello")
            }
        }
    }
}

#Preview {
    ContentView()
}
