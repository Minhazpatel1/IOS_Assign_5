struct DetailView: View {
    let president: President

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                AsyncImage(url: URL(string: president.url.trimmingCharacters(in: .whitespaces))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                } placeholder: {
                    ProgressView()
                }

                Text(president.name).font(.largeTitle).multilineTextAlignment(.center)
                Text("President \(ordinal(president.number))").font(.headline)
                Text("Served: \(president.startDate) – \(president.endDate)")
                Text("Nickname: \(president.nickname)")
                Text("Party: \(president.politicalParty)")
            }
            .padding()
        }
        .navigationTitle(president.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    func ordinal(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}
