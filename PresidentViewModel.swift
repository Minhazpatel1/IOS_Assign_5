class PresidentViewModel: ObservableObject {
    @Published var presidents: [President] = []

    init() {
        loadPresidents()
    }

    func loadPresidents() {
        guard let url = URL(string: "https://faculty.cs.niu.edu/~mcmahon/CS321/presidents.json") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    var decoded = try JSONDecoder().decode([President].self, from: data)
                    decoded.sort { $0.number < $1.number }

                    DispatchQueue.main.async {
                        self.presidents = decoded
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
