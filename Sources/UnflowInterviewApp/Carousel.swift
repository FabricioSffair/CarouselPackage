import SwiftUI

public struct Carousel: View {
    
    public init() {}

    // TODO: Retrieve info from config file
    public var body: some View {
        CarouselView(pages: [
            .standard(title: "Test", text: "Use Audio Rooms for fun activities like socials. Turn on Boogie Mode to hve a random song play and so you can dance and get your heart pumping - the best part, nobody can see you!", image: "image1", buttonTitle: "Next", backgroundImage: "bg1"),
            .standard(title: "Test", text: "Test", image: "image2", buttonTitle: "Next", backgroundImage: "bg2"),
            .standard(title: "Test", text: "Test", image: "image3", buttonTitle: nil, backgroundImage: "bg3")
        ])
    }
}

struct Carousel_Previews: PreviewProvider {
    
    static var previews: some View {
        Carousel()
    }
}
