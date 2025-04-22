struct ContentView: View {
    @StateObject var viewModel = PresidentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.presidents) { president in
                NavigationLink(destination: DetailView(president: president)) {
                    VStack(alignment: .leading) {
                        Text(president.name).font(.headline)
                        Text(ordinal(president.number)).font(.subheadline)
                    }
                }
            }
            .navigationTitle("US Presidents")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func ordinal(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}
