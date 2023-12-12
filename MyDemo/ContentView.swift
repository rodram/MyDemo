import SwiftUI

struct ContentView: View {
    @State private var apiData: String = "Väntar på data..."

    var body: some View {
        VStack {
            Text("Hämtat data från API:")
                .font(.headline)
                .padding()

            Text(apiData)
                .padding()

            Button("Hämta data") {
                fetchData()
            }
            .padding()
        }
    }

    private func fetchData() {
        // Ersätt URL_STRING med det verkliga API:ets URL
        let urlString = "https://jsonplaceholder.typicode.com/posts/1"

        guard let url = URL(string: urlString) else {
            print("Ogiltig URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Fel vid hämtning av data: \(error?.localizedDescription ?? "Okänt fel")")
                return
            }

            if let decodedData = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.apiData = decodedData
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
