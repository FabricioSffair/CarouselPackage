import SwiftUI

public struct Carousel: View {
    
    public init() {}

    // TODO: Retrieve info from config file
    @State var pages: [PageStyle] = []
    @ObservedObject var viewModel: CarouselViewModel = CarouselViewModel()
    
    public var body: some View {
        CarouselView()
            .environmentObject(viewModel)
    }
}

struct Carousel_Previews: PreviewProvider {
    
    static var previews: some View {
        Carousel()
    }
}
