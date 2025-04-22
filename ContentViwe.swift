import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PresidentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.presidents) { president in
                NavigationLink(destination: DetailView(president: president)) {
                    HStack {
                        AsyncImage(url: URL(string: president.url.trimmingCharacters(in: .whitespaces))) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        VStack(alignment: .leading) {
                            Text(president.name)
                                .font(.headline)
                            Text(president.politicalParty)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Presidents")
        }
    }
}
