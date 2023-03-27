import SwiftUI

struct ContentView: View {
    @State private var aiName = ""

    var body: some View {
        VStack {
            TextField("Enter AI character name", text: $aiName)
                .padding()
        }
    }
}
