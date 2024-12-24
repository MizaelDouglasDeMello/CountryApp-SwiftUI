import SwiftUI

struct URLImage: View {
    let url: URL
    @State private var imageData: Data?

    var body: some View {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "photo") // Placeholder
                .resizable()
                .onAppear(perform: loadImage)
        }
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
        }.resume()
    }
}
