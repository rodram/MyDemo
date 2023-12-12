import SwiftUI

struct ContentView: View {
    @State private var newItem = ""
    @State private var items: [String] = []

    var body: some View {
        VStack {
            HStack {
                TextField("Skriv här", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    addItem()
                }) {
                    Text("Lägg till")
                }
            }
            .padding()
            
            List(items, id: \.self) { item in
                Text(item)
            }

            Button(action: {
                resetList()
            }) {
                Text("Nollställ")
            }
            .padding()
        }
    }

    private func addItem() {
        items.append(newItem)
        newItem = ""
    }

    private func resetList() {
        items.removeAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
