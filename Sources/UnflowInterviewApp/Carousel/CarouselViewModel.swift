import Foundation
import Combine

class CarouselViewModel: ObservableObject {
    
    @Published var pages: [PageStyle] = []
    
    init() {
        parseConfig()
    }
    
    private func parseConfig() {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let config = try? PropertyListDecoder().decode(Config.self, from: data) else {
                  return
              }
        pages = config.pages.map {
            PageStyle.standard(title: $0.title, text: $0.message, image: $0.image, buttonTitle: $0.buttonTitle, backgroundImage: $0.backgroundImage)
        }
    }
    
}

