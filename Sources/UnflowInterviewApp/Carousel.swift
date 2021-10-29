import SwiftUI

public struct Carousel: View {
    
    public init() {}
    
    public var body: some View {
        CarouselView(pages: [
            .standard(title: "Test", text: "Test", image: "image1", backgroundImage: "bg1"),
            .standard(title: "Test", text: "Test", image: "image2", backgroundImage: "bg2"),
            .standard(title: "Test", text: "Test", image: "image3", backgroundImage: "bg3")
        ])
    }
}

struct Carousel_Previews: PreviewProvider {
    
    static var previews: some View {
        Carousel()
    }
}
