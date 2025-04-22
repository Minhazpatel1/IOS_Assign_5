import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PresidentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.presidents) { president in
                NavigationLink(destination: DetailView(president: president)) {
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: president.url.trimmingCharacters(in: .whitespaces))) { image in
                            image
                                .resizable()
                                .scaledToFit() // Preserves full image without clipping
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(president.name)
                                .font(.headline)
                                .foregroundColor(.primary)

                            Text(president.politicalParty)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Presidents")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
